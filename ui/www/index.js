/// \file	index.js
/// \brief	Code behind the web UI for FOC.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

// Default host to be used.
const DEFAULT_HOST = "192.168.42.123";

/// Motor max current, in amperes.
/// This applies both for the slider and the chart.
const MOTOR_MAX_CURRENT_A = 0.2;

/// Motor max speed, in RPM.
/// This applies both for the slider and the chart.
const MOTOR_MAX_SPEED_RPM = 5000;

/// Motor max voltage, in volts.
/// This is shown on the chart only.
const MOTOR_MAX_VOLTAGE_V = 25;


const TICK_PERIOD_MS = 100;
const TICKS_PER_SECONDS = 1000 / TICK_PERIOD_MS;
const CHART_UPDATE_TICKS = 10 * TICKS_PER_SECONDS;
const CAPTURE_SAMPLE_COUNT = 65536;

// Register names.
const REG_CONTROL = "Control";
const REG_FLUX_SP = "FluxSp";
const REG_FLUX_KP = "FluxKp";
const REG_FLUX_KI = "FluxKi";
const REG_TORQUE_SP = "TorqueSp";
const REG_TORQUE_KP = "TorqueKp";
const REG_TORQUE_KI = "TorqueKi";
const REG_SPEED_SP = "RPMSp";
const REG_SPEED_KP = "RPMKp";
const REG_SPEED_KI = "RPMKi";
const REG_ANGLE_SHIFT = "Shift";
const REG_VD = "Vd";
const REG_VQ = "Vq";
const REG_FA = "Fa";
const REG_FB = "Fb";
const REG_MODE = "Mode";

const REG_ANGLE = "Angle";
const REG_SPEED = "Speed";
const REG_ID = "Id";
const REG_IQ = "Iq";

const REG_LEDS = "LEDs";
const REG_ERRORLIMIT = "ErrorLimit";
const REG_CONFIGURATION = "Configuration";
const REG_SPREADSPECTRUM = "SpreadSpectrum";

//  Capture SOURCE NSAMPLES [DECIMATION]
const COMMAND_CAPTURE = "Capture";
const COMMAND_MOTOR = "Motor";
const COMMAND_RESET_ERROR = "ResetError";

const CAPTURE_SOURCE_ADC = "ADC"
const CAPTURE_SOURCE_IDIQ = "IDIQ";
const CAPTURE_SOURCE_VDVQ = "VDVQ";

// Values for th
const CONTROL_STOPPED = 0;
const CONTROL_SPEED = 1;
const CONTROL_MANUAL_TORQUE_FLUX = 2;
const CONTROL_MANUAL_TORQUE = 3;
const CONTROL_SPEED_WITHOUT_TORQUE = 4;
const CONTROL_TORQUE = 5;
const CONTROL_MANUAL_TORQUE_FLUX_FIXED_SPEED = 6;
const CONTROL_FIXED_POSITION = 7;

/// Size of the binary header, in bytes.
const BINARY_HEADER_SIZE = 32;
/// Number of samples to be requested for the chart.
const CHART_NSAMPLES = 2 * 625;
/// Chart update period, in milliseconds.
const CHART_UPDATE_MS = 500;
/// Timeout for receiving chart data, in milliseconds. The data capture request will be repeated after the timeout.
const CHART_TIMEOUT_MS = 5000;


/// Data capture decimation factor. Value of 24 divides the sampling rate by 25.
var decimation_factor = 24;

/// Configuration initialized to the default values.
var configuration = { "ppm" : 1000, "adc2A" : 0.00039, "pwm2V":0.00036620, "design" : "N/A", "testmode" : false, "samplerate" : 78125 };
/// Default capture source name.
var capture_source = CAPTURE_SOURCE_ADC;

// -------------- State variables
/// Cache of the control variable.
var mode_reg = 0;

/// Is the motor running?
function is_motor_running() {
	return mode_reg !== 0;
}

/// Are we in speed control mode?
function is_mode_speed() {
	return mode_reg===CONTROL_SPEED || mode_reg===CONTROL_SPEED_WITHOUT_TORQUE;
}

function is_mode_torque() {
	return mode_reg===CONTROL_TORQUE;
}

var ch_0 = [];
var ch_1 = [];
var ch_2 = [];
var ch_3 = [];
var ch_4 = [];
var ch_5 = [];
var ch_6 = [];
var ch_7 = [];

/// Data for the chart.
var data = [
	{ data : ch_0, label : 'Ia'},
	{ data : ch_1, label : 'Ib'},
	{ data : ch_2, label : 'Ic'},
];

/// Options for the chart.
var options = {
	/* title : 'ADC data', */
	xaxis: { minorTickFreq: 4 , min: 0, max: CHART_NSAMPLES - 1, title: 'Time, ms' },
	yaxis: { max: 5, min: -5, title: 'Current, A', titleAngle: -270.0 },
	grid: { minorVerticalLines: true },
	selection : { mode : 'xy', fps : 30 },
	HtmlText: false
};

var graph = null;
var container = null;
var mode = "zoom";
var start = null;

var ui_design_name = null;
var ui_version = null;

var gauge_current = null;
var gauge_current_last = null;

var gauge_speed = null;
var gauge_speed_last = null;

var ui_speed_display = null;
var ui_current_display = null;

var ui_chart_ia_ab = null;
var ui_chart_speed = null;
var ui_chart_id_iq = null;
var ui_chart_vs = null;
var ui_chart_vd_vq = null;

var ui_chart_live = null;
var ui_chart_zoom_slider = null;
var ui_chart_zoom_value = null;

var ui_direction_forward = null;
var ui_direction_reverse = null;

var ui_mode_current = null;
var ui_mode_speed = null;
var ui_mode_speed_notorque = null;

var ui_current_slider = null;
var ui_current_text = null;

var ui_speed_slider = null;
var ui_speed_text = null;

var ui_errorlimit_slider = null;
var ui_errorlimit_text = null;

var ui_start_stop = null;

var ui_leds = [null, null, null, null];
var ui_leds_state = [false, false, false, false];

var ui_error_text = null;

// Test version stuff.
var ui_spreadspectrum = null;

var dev_rpm_data = null;
var dev_rpm_progress = null;

// Variables.

var have_current_setpoint = false;
var have_speed_setpoint = false;
var have_mode = false;
var have_errorlimit = false;
var have_configuration = false;
var have_spreadspectrum = false;
var capture_tick_count = 0;
var have_not_queried_yet = false;

var chart_update_time_ms = 0;
var chart_request_time_ms = 0;
var chart_zoom = 1.0;
var chart_last_data = null;

var ui_direction_callback_disabled = false;
var ui_direction_callback_active = false;
var ui_mode_callback_disabled = false;
var ui_slider_callback_disabled = false;
var ui_spreadspectrum_callback_disabled = false;

/// #EE9090 = Pink
const COLOR_MOTOR_ON = "#EE9090";

/// #90EE90 = Lightgreen
const COLOR_MOTOR_OFF = "#90EE90";

/// Yellow
const COLOR_MOTOR_CALIBRATING = "#FFCC00";

const COLOR_LED_ON = "#F05050";
const COLOR_LED_OFF = "transparent";
const COLOR_NORMAL_LED_ON = "#90EE90";

var sound = document.getElementById("sound-fail");

var sound_fail = new Audio("data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  

function drawGraph(opts,d) {
	var o = Flotr._.extend(Flotr._.clone(options), opts || {});
	return Flotr.draw(container, d, o);
}
	
function stringOfUint8Array(u8)
{
	var r = "";
	for (i=0; i<u8.length; ++i) {
		var	x = u8[i];
		if (x === 0) {
			break;
		}
		r += String.fromCharCode(x);
	}
	return r;
}

function check_if_not_checked(checkbox, must_check)
{
	if (must_check) {
		if (!checkbox.prop("checked")) {
			checkbox.prop("checked", true).change();
		}
	}
}

function update_direction_ui(must_update, is_forward)
{
	if (must_update && !ui_direction_callback_active) {
		try {
			ui_direction_callback_disabled = true;
			check_if_not_checked(ui_direction_forward, is_forward);
			check_if_not_checked(ui_direction_reverse, !is_forward);
		}
		finally {
			ui_direction_callback_disabled = false;
		}
	}
}


/// -------------- Websocket initialization
var server_url = "ws://" + (location.host == "" ? DEFAULT_HOST : location.host) + ":80/";
ws = new WebSocket(server_url, "field-oriented-control");
ws.binaryType = "arraybuffer";

/// -------------- Chart plotter

/// \brief Get the factor to convert indices to x-coordinates, e.g. in milliseconds.
function get_i2x()
{
	return (1000.0  * (decimation_factor + 1)) / configuration.samplerate;
}

function copy_channel(dst_data, samples, nsamples, nchannels, source_channel, factor) {
	var i2x = get_i2x();

	for (var i_sample=0; i_sample<nsamples; ++i_sample) {
		dst_data[i_sample] = [i2x * i_sample, factor * samples[i_sample*nchannels + source_channel]];
	}
}

function update_chart(e_data) {
	// Binary header first.
	var h16 = new Uint16Array(e_data, 0, 2);
	var nchannels = h16[0];
	var nsamples = h16[1];
	var h32 = new Uint32Array(e_data, 4, 1);
	var sample_rate = h32[0];
	var h8 = new Uint8Array(e_data, 8, BINARY_HEADER_SIZE - 8);
	var source = stringOfUint8Array(h8);
	// alert("nchannels:" + nchannels + " nsamples:" + nsamples + " sample_rate:" + sample_rate);
	var samples = new Int16Array(e_data, BINARY_HEADER_SIZE, nsamples * nchannels);
	var i2x = get_i2x();
	options.xaxis.max = (nsamples - 1)* i2x;

	// The plot depends on the chart type.
	if (source === CAPTURE_SOURCE_ADC) {
		data = [
			{ data : ch_0, label : 'Ia'},
			{ data : ch_1, label : 'Ib'},
			{ data : ch_2, label : 'Ic'},
			{ data : ch_3, label : 'Speed/1000'},
		];
		options.yaxis.max = MOTOR_MAX_CURRENT_A / chart_zoom;
		options.yaxis.min = -MOTOR_MAX_CURRENT_A / chart_zoom;
		options.yaxis.title = 'Current, A; Speed RPM/1000';

		var factor = configuration.adc2A;
		copy_channel(data[0].data, samples, nsamples, nchannels, 0, factor);
		copy_channel(data[1].data, samples, nsamples, nchannels, 1, factor);

		var ia = data[0].data;
		var ib = data[1].data;
		var ic = data[2].data;
		var speed = data[3].data;
		var ic_sample = 0;
		for (var i_sample=0; i_sample<nsamples; ++i_sample) {
			ic[i_sample] = [i2x * i_sample, -ia[i_sample][1] - ib[i_sample][1]];
		}
		copy_channel(data[3].data, samples, nsamples, nchannels, 2, 0.001);
	}
	else if (source === CAPTURE_SOURCE_IDIQ) {
		data = [
			{ data : ch_0, label : 'Id'},
			{ data : ch_1, label : 'Iq'},
			{ data : ch_2, label : 'Speed/1000'},
		];
		options.yaxis.max = (MOTOR_MAX_SPEED_RPM * 0.001) / chart_zoom;
		options.yaxis.min = -(MOTOR_MAX_SPEED_RPM * 0.001) / chart_zoom;
		options.yaxis.title = 'Current, A; Speed RPM/1000';

		var factor = configuration.adc2A;
		copy_channel(data[0].data, samples, nsamples, nchannels, 0, factor);
		copy_channel(data[1].data, samples, nsamples, nchannels, 1, factor);
		copy_channel(data[2].data, samples, nsamples, nchannels, 2, 0.001);
	}
	else if (source === CAPTURE_SOURCE_VDVQ) {
		data = [
			{ data : ch_0, label : 'Vd'},
			{ data : ch_1, label : 'Vq'},
		];
		options.yaxis.max = MOTOR_MAX_VOLTAGE_V / chart_zoom;
		options.yaxis.min = -MOTOR_MAX_VOLTAGE_V / chart_zoom;
		options.yaxis.title = 'Voltage, V';

		var factor = configuration.pwm2V;
		copy_channel(data[0].data, samples, nsamples, nchannels, 0, factor);
		copy_channel(data[1].data, samples, nsamples, nchannels, 1, factor);
	}
	else {
		data = [
			{ data : ch_0, label : 'CH0'},
			{ data : ch_1, label : 'CH1'},
			{ data : ch_2, label : 'CH2'},
			{ data : ch_3, label : 'CH3'},
		];
		options.yaxis.max = 32000;
		options.yaxis.min = -32000;
		options.yaxis.title = 'Arbitrary units';

		// Generic plot.
		for (var i_channel=0; i_channel<nchannels && i_channel<data.length; ++i_channel) {
			var dst = data[i_channel].data;
			for (var i_sample=0; i_sample<nsamples; ++i_sample) {
				dst[i_sample] = [i2x * i_sample, samples[i_sample*nchannels + i_channel]];
			}
		}
	}
	graph = drawGraph(options, data);
	/// ws.captureData(CAPTURE_SOURCE_ADC, CHART_NSAMPLES, decimation_factor);
	chart_update_time_ms = Date.now();
}

/// -------------- Websocket Message handler
ws.onmessage = function(e)
{
	if (typeof e.data === "string") {
		var v = e.data.split(" ");
		var regname = v[0];
		switch (regname) {
		case REG_ERRORLIMIT:
			if (!have_errorlimit) {
				var errorlimit = parseInt(v[1]);
				ui_errorlimit_slider.slider('value', errorlimit);
				ui_errorlimit_text.val(errorlimit);
				have_errorlimit = true;
			}
			break;
		case REG_CONFIGURATION:
			var json_config = e.data.substring(REG_CONFIGURATION.length + 1);
			configuration = JSON.parse(json_config);
			ui_version.text(configuration.focserver);
			ui_design_name.text(configuration.design);
			if (configuration.testmode) {
				$(".testonly").show();
			}
			else {
				$(".testonly").hide();
			}
			have_configuration = true;
			break;
		case REG_MODE:
			mode_reg = parseInt(v[1]);
			switch (mode_reg) {
			case CONTROL_TORQUE:
				try {
					ui_mode_callback_disabled = true;
					ui_mode_current.prop("checked", true).change();
				}
				finally {
					ui_mode_callback_disabled = false;
				}
				break;
			case CONTROL_SPEED_WITHOUT_TORQUE:
				try {
					ui_mode_callback_disabled = true;
					ui_mode_speed_notorque.prop("checked", true).change();
				}
				finally {
					ui_mode_callback_disabled = false;
					break;
				}
				break;
			default:
				// Default to speed when no value for the control register set.
				if (!have_mode) {
					try {
						ui_mode_callback_disabled = true;
						ui_mode_speed.prop("checked", true).change();
					}
					finally {
						ui_mode_callback_disabled = false;
					}
				}
				break;
			}
			have_mode = true;
			update_startstop_ui();

			if (ui_mode_current.prop("checked")) {
				update_direction_ui(true, ui_current_slider.slider("value") >= 0);
			}
			else {
				update_direction_ui(true, ui_speed_slider.slider("value") >= 0);
			}
			break;
		case REG_SPEED:
			var speed = parseInt(v[1]);
			var speed_rpm = speed + " RPM";
			if (gauge_speed) {
				gauge_speed.value = speed;
			}
			if (dev_rpm_data) {
				dev_rpm_data.innerHTML = speed_rpm;
			}
			if (dev_rpm_progress) {
				dev_rpm_progress.value = speed;
			}
			ui_speed_display.val(speed_rpm);
			break;
		case REG_ANGLE:
			break;
		case REG_TORQUE_SP:
			var sp = parseFloat((parseInt(v[1]) * configuration.adc2A).toFixed(3));
			if (!have_current_setpoint) {
				have_current_setpoint = true;
				ui_current_slider.slider('value', sp);
			}
			break;
		case REG_TORQUE_KP:
			break;
		case REG_TORQUE_KI:
			break;
		case REG_SPEED_SP:
			var sp = parseInt(v[1]);
			if (!have_speed_setpoint) {
				have_speed_setpoint = true;
				ui_speed_slider.slider('value', sp);
			}
			break;
		case REG_IQ:
			var iq = parseInt(v[1]) * configuration.adc2A;
			var iq_text = iq.toFixed(3) + " A";
			if (gauge_current) {
				gauge_current.value = iq;
			}
			ui_current_display.val(iq_text);
			break;
		case REG_LEDS:
			if (!configuration.testmode) {
				// Do nothing when not in testmode.
				break;
			}
			var leds = parseInt(v[1]);
			for (i=0; i<ui_leds.length; ++i) {
				var led1 = ui_leds[i];
				var old_state = ui_leds_state[i];
				var new_state = (leds & (1 << i)) > 0;
				if (led1 && new_state !== old_state) {
					if (new_state) {
						led1.css('background-color', (i==3 ? COLOR_NORMAL_LED_ON : COLOR_LED_ON));
					}
					else {
						led1.css('background-color', COLOR_LED_OFF);
					}
					ui_leds_state[i] = new_state;
					if (i == 0) {
						if (new_state) {
							ui_error_time.append((new Date().toString()) + "\r\n");
							sound_fail.play();
						}
					}
				}
			}
			break;
		case REG_SPREADSPECTRUM:
			var ss_val = parseInt(v[1]);
			try {
				ui_spreadspectrum_callback_disabled = true;
				check_if_not_checked(ui_spreadspectrum, ss_val!=0);
			}
			finally {
				ui_spreadspectrum_callback_disabled = false;
			}
			have_spreadspectrum = true;
			// TODO: set the button
			break;
		default:
			// do what?
		}
	}
	else {
		if (ui_chart_live.prop("checked")) {
			chart_last_data = e.data;
			update_chart(e.data);
		}
	}
}

ws.onopen = function(e) {
	have_current_setpoint = false;
	have_speed_setpoint = false;
	have_mode = false;
	have_errorlimit = false;
	have_configuration = false;
	capture_tick_count = 0;
}

ws.queryRegister = function(registerName) {
	ws.send(registerName + "?");
}

ws.setRegister = function(registerName, value) {
	ws.send(registerName + " " + value);
}

ws.captureData = function(dataSource, sampleCount, decimation) {
	ws.send(COMMAND_CAPTURE + " " + dataSource + " " + sampleCount + " " + decimation);
}

// -------------- UI handdlers
// Send torque setpoint accordign to the UI.
function send_torque_setpoint()
{
	var current = ui_current_slider.slider("value") / configuration.adc2A;
	ws.setRegister(REG_TORQUE_SP, current);
}

function send_speed_setpoint()
{
	var speed = ui_speed_slider.slider("value");
	ws.setRegister(REG_SPEED_SP, speed);
}

function send_setpoints()
{
	if (ui_mode_current.prop("checked")) {
		send_torque_setpoint();
	}
	else {
		send_speed_setpoint();
	}
}

/// Send the Motor command according to the UI. Default to speed if undeterminate.
function send_motor_on_command()
{
	if (ui_mode_current.prop("checked")) {
		send_torque_setpoint();
		ws.setRegister(COMMAND_MOTOR, CONTROL_TORQUE);
	}
	else if (ui_mode_speed_notorque.prop("checked")) {
		send_torque_setpoint();
		ws.setRegister(COMMAND_MOTOR, CONTROL_SPEED_WITHOUT_TORQUE);
	}
	else {
		ws.setRegister(COMMAND_MOTOR, CONTROL_SPEED);
	}
	ws.queryRegister(REG_MODE);
}

function update_speed_slider_ui(is_forward) {
	if (ui_mode_speed.prop("checked") || ui_mode_speed_notorque.prop("checked")) {
		var v = ui_speed_slider.slider('value');
		var v_is_forward = v >= 0;
		if (v_is_forward !== is_forward) {
			try {
				ui_slider_callback_disabled = true;
				ui_speed_slider.slider('value', -ui_speed_slider.slider('value'));
			}
			finally {
				ui_slider_callback_disabled = false;
			}
		}
	}
}

function update_current_slider_ui(is_forward) {
	if (ui_mode_current.prop("checked")) {
		var v = ui_current_slider.slider('value');
		var v_is_forward = v >= 0;
		if (v_is_forward !== is_forward) {
			try {
				ui_slider_callback_disabled = true;
				ui_current_slider.slider('value', -ui_current_slider.slider('value'));
			}
			finally {
				ui_slider_callback_disabled = false;
			}
		}
	}
}

function ui_chart_live_set(ev)
{
	chart_request_time_ms = Date.now();
	ws.captureData(capture_source, CHART_NSAMPLES, decimation_factor);
}

function ui_direction_forward_set(ev) {
	if (!ui_direction_callback_disabled) {
		try {
			ui_direction_callback_active = true;
			// FIXME: current setpoint will be wrong :(
			update_speed_slider_ui(true);
			update_current_slider_ui(true);
			send_setpoints();
		}
		finally {
			ui_direction_callback_active = false;
		}
	}
}

function ui_direction_reverse_set(ev) {
	if (!ui_direction_callback_disabled) {
		try {
			ui_direction_callback_active = true;
			update_speed_slider_ui(false);
			update_current_slider_ui(false);
			send_setpoints();
		}
		finally {
			ui_direction_callback_active = false;
		}
	}
}

function ui_mode_current_set(ev) {
	if (!ui_mode_callback_disabled) {
		if (is_motor_running()) {
			send_torque_setpoint();
			ws.setRegister(COMMAND_MOTOR, CONTROL_TORQUE);
		}
		update_direction_ui(true, ui_current_slider.slider("value") >= 0);
	}
}

function ui_mode_speed_set(ev) {
	if (!ui_mode_callback_disabled) {
		if (is_motor_running()) {
			send_speed_setpoint();
			ws.setRegister(COMMAND_MOTOR, CONTROL_SPEED);
		}
		update_direction_ui(true, ui_speed_slider.slider("value") >= 0);
	}
}

function ui_mode_speed_notorque_set(ev) {
	if (!ui_mode_callback_disabled) {
		if (is_motor_running()) {
			send_torque_setpoint();
			ws.setRegister(COMMAND_MOTOR, CONTROL_SPEED_WITHOUT_TORQUE);
		}
		update_direction_ui(true, ui_speed_slider.slider("value") >= 0);
	}
}

function ui_current_changed(ev, ui) {
	ui_current_text.val(ui.value.toFixed(3));
	if (!ui_slider_callback_disabled) {
		ws.setRegister(REG_TORQUE_SP, Math.round(ui.value / configuration.adc2A));
		update_direction_ui(ui_mode_current.prop("checked"), ui.value>=0);
	}
}

function ui_current_text_keyup(ev) {
	if (event.keyCode == 13) {
		var new_current = parseFloat(ui_current_text.val());
		ui_current_slider.slider('value', new_current);
	}
}

function ui_speed_changed(ev, ui) {
	ui_speed_text.val(ui.value);
	if (!ui_slider_callback_disabled) {
		ws.setRegister(REG_SPEED_SP, ui.value);
		update_direction_ui(ui_mode_speed.prop("checked"), ui.value>=0);
	}
}

function ui_speed_text_keyup(ev) {
	if (event.keyCode == 13) {
		var new_speed = parseInt(ui_speed_text.val());
		ui_speed_slider.slider('value', new_speed);
	}
}

function ui_errorlimit_changed(ev, ui) {
	if (have_errorlimit) {
		ui_errorlimit_text.val(ui.value);
		ws.setRegister(REG_ERRORLIMIT, ui.value);
	}
}

function ui_errorlimit_text_keyup(ev) {
	if (have_errorlimit && event.keyCode == 13) {
		var new_errorlimit = parseDouble(ui_errorlimit_text.val());
		ui_errorlimit_slider.slider('value', new_errorlimit);
	}
}

function ui_chart_zoom_slider_changed(ev, ui) {
	chart_zoom = Math.pow(10, ui.value);
	ui_chart_zoom_value.text(chart_zoom.toFixed(2));
	if (chart_last_data) {
		update_chart(chart_last_data);
	}
}

function ui_spreadspectrum_set(ev)
{
	if (!ui_spreadspectrum_callback_disabled) {
		if (ui_spreadspectrum.prop("checked")) {
			ws.setRegister(REG_SPREADSPECTRUM, 1);
		}
		else {
			ws.setRegister(REG_SPREADSPECTRUM, 0);
		}
	}
}

function update_startstop_ui() {
	if (is_motor_running()) {
		ui_start_stop.css('background-color', COLOR_MOTOR_ON);
	}
	else {
		ui_start_stop.css('background-color', COLOR_MOTOR_OFF);
	}
}

function toggle_motor() {
	var running = is_motor_running();
	if (running) {
		ws.setRegister(COMMAND_MOTOR, CONTROL_STOPPED);
		ui_start_stop.css('background-color', COLOR_MOTOR_OFF);
	}
	else {
		send_motor_on_command();
		ui_start_stop.css('background-color', COLOR_MOTOR_CALIBRATING);
	}
	ws.queryRegister(REG_MODE);
}

function reset_error() {
	ws.send(COMMAND_RESET_ERROR);
}

function make_checkbox(checkbox_selector, new_capture_source)
{
	var r = $(checkbox_selector);
	r.checkboxradio();
	if (new_capture_source) {
		r.on("change", function() {
			capture_source = new_capture_source;
			capture_tick_count = CHART_UPDATE_TICKS;
		});
	}
	return r;
}

/// -------------- Chart initialization to be performed after page load.
document.addEventListener('DOMContentLoaded', function() {
	dev_rpm_data = document.getElementById("rpm_data");
	dev_rpm_progress = document.getElementById("rpm_progress");
	// slider_speed = document.getElementById("speed-slider");

	ui_design_name = $("#lbl-design-name");
	ui_version = $("#lbl-focserver-date");

	ui_current_display = $("#current-display");
	ui_current_display.val("N/A");

	ui_speed_display = $("#speed-display");
	ui_speed_display.val("N/A");


	ui_current_slider = $("#current-slider");
	ui_current_slider.slider({
		min: -MOTOR_MAX_CURRENT_A,
		max: MOTOR_MAX_CURRENT_A,
		slide: ui_current_changed,
		change: ui_current_changed,
		step: 0.001,
		orientation: "vertical",
	});

	ui_current_text = $("#current-text");
	ui_current_text.keyup(ui_current_text_keyup);


	ui_speed_slider = $("#speed-slider");
	ui_speed_slider.slider({
		min: -MOTOR_MAX_SPEED_RPM,
		max: MOTOR_MAX_SPEED_RPM,
		slide: ui_speed_changed,
		change: ui_speed_changed,
		step: 5,
		orientation: "vertical",
	});

	ui_speed_text = $("#speed-text");
	ui_speed_text.keyup(ui_speed_text_keyup);


	ui_errorlimit_slider = $("#errorlimit-slider");
	ui_errorlimit_slider.slider({
		min: 0,
		max: 1000,
		slide: ui_errorlimit_changed,
		change: ui_errorlimit_changed,
		step: 1,
		orientation: "vertical",
	});

	ui_errorlimit_text = $("#errorlimit-text");
	ui_errorlimit_text.keyup(ui_errorlimit_text_keyup);


	ui_chart_ia_ab = make_checkbox("#chart-ia-ib", CAPTURE_SOURCE_ADC);
	ui_chart_speed = make_checkbox("#chart-speed");
	ui_chart_id_iq = make_checkbox("#chart-id-iq", CAPTURE_SOURCE_IDIQ);
	ui_chart_vs = make_checkbox("#chart-vs");
	ui_chart_vd_vq = make_checkbox("#chart-vd-vq", CAPTURE_SOURCE_VDVQ);

	ui_chart_live = make_checkbox("#chart-live");
	ui_chart_live.on("change", ui_chart_live_set);

	ui_chart_zoom_slider = $("#zoom-slider");
	ui_chart_zoom_slider.slider({
		min: -2,
		max: 2,
		slide: ui_chart_zoom_slider_changed,
		change: ui_chart_zoom_slider_changed,
		step: 0.02,
		orientation: "vertical",
	});
	ui_chart_zoom_value = $("#zoom-value");
	ui_chart_zoom_value.text("1.00");

	ui_mode_current = $("#mode-current");
	ui_mode_current.checkboxradio();
	ui_mode_current.on("change", ui_mode_current_set);

	ui_mode_speed = $("#mode-speed");
	ui_mode_speed.checkboxradio();
	ui_mode_speed.on("change", ui_mode_speed_set);

	ui_mode_speed_notorque = $("#mode-speed-notorque");
	ui_mode_speed_notorque.checkboxradio();
	ui_mode_speed_notorque.on("change", ui_mode_speed_notorque_set);

	ui_direction_forward = $("#direction-forward");
	ui_direction_forward.checkboxradio();
	ui_direction_forward.on("change", ui_direction_forward_set);

	ui_direction_reverse = $("#direction-reverse");
	ui_direction_reverse.checkboxradio();
	ui_direction_reverse.on("change", ui_direction_reverse_set);

	ui_start_stop= $("#start-stop-button");
	update_startstop_ui();

	ui_leds[0] = $("#lbl-LED-0");
	ui_leds[1] = $("#lbl-LED-1");
	ui_leds[2] = $("#lbl-LED-2");
	ui_leds[3] = $("#lbl-LED-3");

	ui_error_time = $("#lbl-error-time");

	ui_spreadspectrum = make_checkbox("#spreadspectrum");
	ui_spreadspectrum.on("change", ui_spreadspectrum_set);

	container = document.getElementById("chart");
	function initializeDrag(e) {
		start = graph.getEventPosition(e);
		Flotr.EventAdapter.observe(document, 'mousemove', move);
		Flotr.EventAdapter.observe(document, 'mouseup', stopDrag);
	}

	function stopDrag() {
		Flotr.EventAdapter.stopObserving(document, 'mousemove', move);
	}

	Flotr.EventAdapter.observe(container, 'flotr:select', function (area) {
			graph = drawGraph({
				xaxis: {min:area.x1, max:area.x2},
				yaxis: {min:area.y1, max:area.y2}
			}, data);
	});

	Flotr.EventAdapter.observe(container, 'flotr:click', function () { 
			drawGraph(options,data); 
	});
	graph = drawGraph(options,data);

	if (document.getElementById('gauge-current')) {
		gauge_current = new RGraph.Gauge({
			id: 'gauge-current',
			min: -5,
			max: +5,
			value: 0,
			options: {
				shadow: false,	// With shadow the Chrome will draw the gauge a bit wider every time draw() is called.
				titleTop: "Current Iq, A",
				yellowWidth: 0,
				redWidth: 0,
				// valueText: true // Will leave ugly residue when the number of digits is reduced
				textAccessible: true
			}
		});
	}

	if (document.getElementById('gauge-speed')) {
		gauge_speed = new RGraph.Gauge({
			id: 'gauge-speed',
			min: -5000,
			max: +5000,
			value: 0,
			options: {
				shadow: false,	// With shadow the Chrome will draw the gauge a bit wider every time draw() is called.
				titleTop: "Speed, RPM",
				yellowWidth: 0,
				redWidth: 0,
				// valueText: true // Will leave ugly residue when the number of digits is reduced
				textAccessible: true,
			}
		});
	}

	function timer_poll() {
		if (gauge_speed) {
			if (gauge_speed.value != gauge_speed_last) {
				gauge_speed.draw();
				gauge_speed_last = gauge_speed.value;
			}
		}

		if (gauge_current) {
			if (gauge_current.value != gauge_current_last) {
				gauge_current.draw();
				gauge_current_last = gauge_current.value;
			}
		}

		if (ws.readyState === ws.OPEN) {
			if (capture_tick_count == 0) {
				if (!have_configuration) {
					ws.queryRegister(REG_CONFIGURATION);
				}
				if (!have_current_setpoint) {
					ws.queryRegister(REG_TORQUE_SP);
				}
				if (!have_speed_setpoint) {
					ws.queryRegister(REG_SPEED_SP);
				}
				if (!have_mode) {
					ws.queryRegister(REG_MODE);
				}
				if (!have_errorlimit) {
					ws.queryRegister(REG_ERRORLIMIT);
				}
				if (!have_spreadspectrum) {
					ws.queryRegister(REG_SPREADSPECTRUM);
				}
			}
			ws.queryRegister(REG_SPEED);
			ws.queryRegister(REG_IQ);
			if (ui_leds[0] && configuration.testmode) {
				ws.queryRegister(REG_LEDS);
			}

			capture_tick_count += 1;
			if (capture_tick_count > CHART_UPDATE_TICKS) {
				capture_tick_count = 0;
			}

			var ms = Date.now();
			if (ui_chart_live.prop("checked")
				&& ((chart_update_time_ms===0 && chart_request_time_ms===0)
				|| (chart_update_time_ms>chart_request_time_ms && (ms - chart_update_time_ms)>CHART_UPDATE_MS)
				|| (chart_request_time_ms>chart_update_time_ms && (ms - chart_request_time_ms)>CHART_TIMEOUT_MS))) {
				chart_request_time_ms = ms;
				ws.captureData(capture_source, CHART_NSAMPLES, decimation_factor);
			}
		}

		setTimeout(timer_poll, TICK_PERIOD_MS);
	}

	if (gauge_speed || gauge_current || dev_rpm_data || dev_rpm_progress) {
		timer_poll();
	}
}, false);

