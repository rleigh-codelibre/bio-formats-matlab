function []=runbfxunit(xmlfile)
% OME Bio-Formats package for reading and converting biological file formats.
%
% Copyright (C) 2017 Open Microscopy Environment:
%   - Board of Regents of the University of Wisconsin-Madison
%   - Glencoe Software, Inc.
%   - University of Dundee
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as
% published by the Free Software Foundation, either version 2 of the
% License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License along
% with this program; if not, write to the Free Software Foundation, Inc.,
% 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

    import matlab.unittest.TestRunner
    import matlab.unittest.TestSuite
    import matlab.unittest.plugins.XMLPlugin

    dir = fileparts(mfilename('fullpath'));

    suite = TestSuite.fromFolder(dir)
    runner = TestRunner.withNoPlugins;

    p = XMLPlugin.producingJUnitFormat(xmlfile);

    runner.addPlugin(p)
    results = runner.run(suite);
    table(results)

    exit(0)
end
