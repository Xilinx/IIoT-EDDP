# --------------------------------------------------------------------
#Implement Setting
# ------------------------------------------------
set_property flow {Vivado Implementation 2017} [get_runs ${TE::IMPL_NAME}]
set_property strategy Performance_ExplorePostRoutePhysOpt [get_runs impl_1]
# ------------------------------------------------
