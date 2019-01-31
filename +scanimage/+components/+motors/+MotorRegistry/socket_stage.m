function s = socket_stage

s = struct();
s.Names = {'scientifica'};
s.Class = 'dabs.socketStage.socketStage';
s.ListName = 'SocketStage';
s.SupportFastZ = false;
s.SubType = '';
s.TwoStep.Enable = true;
s.TwoStep.FastLSCPropVals = struct(); %Velocity is switched between fast/slow, but determined programatically for each stage type
s.TwoStep.SlowLSCPropVals = struct(); %Velocity is switched between fast/slow, but determined programatically for each stage type
s.TwoStep.InitSlowLSCProps = false;
s.SafeReset = false;
s.NumDimensionsPreset = true;


%--------------------------------------------------------------------------%
% socket_stage.m                                                           %
%--------------------------------------------------------------------------%
