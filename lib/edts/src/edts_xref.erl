%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @doc A wrapper around xref providing some additional features such as
%%%      initialization from a previously saved xref server-state.
%%% @end
%%% @author Thomas Järvstrand <tjarvstrand@gmail.com>
%%% @copyright
%%% Copyright 2012 Thomas Järvstrand <tjarvstrand@gmail.com>
%%%
%%% This file is part of EDTS.
%%%
%%% EDTS is free software: you can redistribute it and/or modify
%%% it under the terms of the GNU Lesser General Public License as published by
%%% the Free Software Foundation, either version 3 of the License, or
%%% (at your option) any later version.
%%%
%%% EDTS is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU Lesser General Public License for more details.
%%%
%%% You should have received a copy of the GNU Lesser General Public License
%%% along with EDTS. If not, see <http://www.gnu.org/licenses/>.
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%_* Module declaration =======================================================
-module(edts_xref).
-behaviour(gen_server).


%%%_* Exports ==================================================================

%% API
%% xref gen_server exports
-export([add_application/2,
         add_application/3,
	 add_directory/2,
         add_directory/3,
	 add_module/2,
         add_module/3,
         add_release/3,
	 add_release/2,
         analyse/2,
         analyse/3,
	 analyze/2,
         analyze/3,
         d/1,
	 forget/1,
         forget/2,
	 get_default/1,
         get_default/2,
	 get_library_path/1,
         info/1,
         info/2,
         info/3,
         m/1,
         q/3,
	 q/2,
         remove_application/2,
	 remove_module/2,
         remove_release/2,
	 replace_application/3,
         replace_application/4,
	 replace_module/3,
         replace_module/4,
	 set_default/2,
         set_default/3,
         set_library_path/2,
         set_library_path/3,
	 update/1,
         update/2,
         variables/1,
         variables/2
        ]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
	 terminate/2,
         code_change/3]).

-export([start/1,
         stop/1]).

%%%_* Includes =================================================================

%%%_* Defines ==================================================================

%%%_* Types ====================================================================

%%%_* API ======================================================================


start(Name) ->
  gen_server:start({local, Name}, ?MODULE, []).

stop(Name) ->
  gen_server:call(Name, stop, inifinity).

%% Xref API
add_application(Srv, App)                -> xref:add_application(Srv, App).
add_application(Srv, App, Opts)          ->
  xref:add_application(Srv, App, Opts).
add_directory(Srv, Dir)                  -> xref:add_directory(Srv, Dir)/2.
add_directory(Srv, Dir, Opts)            ->
  xref:add_directory(Srv, Dir, Opts)/3.
add_module(Srv, File)                    -> xref:add_module(Srv, File).
add_module(Srv, File, Opts)              -> xref:add_module(Srv, File, Opts)/3.
add_release(Srv, Dir)                    -> xref:add_release(Srv, Dir).
add_release(Srv, Dir, Opts)              -> xref:add_release(Srv, Dir, Opts).
analyse(Srv, What)                       -> xref:analyse(Srv, What).
analyse(Srv, What, Opts)                 -> xref:analyse(Srv, What, Opts).
analyze(Srv, What)                       -> xref:analyze(Srv, What).
analyze(Srv, What, Opts)                 -> xref:analyze(Srv, What, Opts).
d(Dir)                                   -> xref:d(Dir).
forget(Srv)                              -> xref:forget(Srv).
forget(Srv, Var)                         -> xref:forget(Srv, Var).
get_default(Srv)                         -> xref:get_default(Srv).
get_default(Srv, Opt)                    -> xref:get_default(Srv, Opt).
get_library_path(Srv)                    -> xref:get_library_path(Srv).
info(Srv)                                -> xref:info(Srv).
info(Srv, What)                          -> xref:info(Srv, What).
info(Srv, What, Qual)                    -> xref:info(Srv, What, Qual).
m(Module)                                -> xref:m(Module).
q(Srv, Q)                                -> xref:q(Srv, Q).
q(Srv, Q, Opts)                          -> xref:q(Srv, Q, Opts).
remove_application(Srv, App)             -> xref:remove_application(Srv, App).
remove_module(Srv, Mod)                  -> xref:remove_module(Srv, Mod).
remove_release(Srv, Dir)                 -> xref:remove_release(Srv, Dir).
replace_application(Srv, App, Dir)       ->
  xref:replace_application(Srv, App, Dir).
replace_application(Srv, App, Dir, Opts) ->
  xref:replace_application(Srv, App, Dir, Opts).
replace_module(Srv, Mod, File)           -> xref:replace_module(Srv, Mod, File).
replace_module(Srv, Mod, File, Opts)     ->
  xref:replace_module(Srv, Mod, File, Opts).
set_default(Srv, Opts)                   -> xref:set_default(Srv, Opts).
set_default(Srv, Opt, Val)               -> xref:set_default(Srv, Opt, Val).
set_library_path(Srv, Path)              -> xref:set_library_path(Srv, Path).
set_library_path(Srv, Path, Opts)        ->
  xref:set_library_path(Srv, Path, Opts).
update(Srv)                              -> xref:update(Srv).
update(Srv, Opts)                        -> xref:update(Srv, Opts).
variables(Srv)                           -> xref:variables(Srv).
variables(Srv, Opts)                     -> xref:variables(Srv, Opts).

%% Gen server callbacks
init(Args) -> xref:init(Args).
handle_call(Request, From, State) -> xref:handle_call(Request, From, State).
handle_cast(Reqest, State) -> xref:handle_cast(Reqest, State).
handle_info(Info, State) -> xref:handle_info(Info, State).
terminate(Reason, State) -> xref:terminate(Reason, State).
code_change(OldVsn, State, Extra) -> xref:code_change(OldVsn, State, Extra).

%%%_* Internal functions =======================================================

%%%_* Emacs ====================================================================
%%% Local Variables:
%%% allout-layout: t
%%% erlang-indent-level: 2
%%% End:

