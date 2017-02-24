function peak_pos = scanPileForPeaks(pile)
%scanPileForPeaks - Find all peaks in a sandpile
%
% Syntax:  peak_pos = scanPileForPeaks(pile)
%
% Inputs:
%    pile - Matrix of shape (pile width, pile width) with integer values 
%    from 0 to 4
%
% Outputs:
%    peak_pos - Vector containing positions of all peaks
%
% Example:
%    peak_pos = scanPileForPeaks([0 1 3; 4 1 2; 2 1 0]);
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: simulateSandpile
%
% Author: Florian Roscheck
% Website: http://github.com/flrs/visual_sandpile
% January 2017; Last revision: 27-January-2017

%------------- BEGIN CODE --------------
peak_pos = find(pile>=4);
%------------- END CODE --------------

