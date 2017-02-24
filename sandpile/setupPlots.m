function [pointer_patch, pile_img, avalanche_ct_plot,...
    avalanche_desc_text] = setupPlots(pile_width, draw_speed)
%setupPlots - This function sets up the sandpile and the avalanche plot
%
% Syntax:  [pointer_patch, pile_img avalanche_ct_plot,...
%              avalanche_desc_text] = setupPlots(pile_width, draw_speed)
%
% Inputs:
%    pile_width - Side length of the square pile
%    draw_speed - Speed of animation
%
% Outputs:
%    pointer_patch - Handle of the patch that shows where new grains have
%       been dropped
%    pile_img - Handle to the image containing the sandpile
%    avalanche_ct_plot - Handle of avalanche counter plot
%    avalanche_desc_text - Handle of descriptive text on avalanche counter
%       plot
%
% Example:
%    [pointer_patch, pile_img avalanche_ct_plot, avalanche_desc_text] = ...
%       setupPlots(20, 0.25)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: plotPile
%
% Author: Florian Roscheck
% Website: http://github.com/flrs/visual_sandpile
% January 2017; Last revision: 27-January-2017

%------------- BEGIN CODE --------------
%% Set up avalanche size plot
figure('position', [750 200 700 500], 'Color', [1 1 1]);
avalanche_ct_plot = loglog(0, 0, '.-k', 'LineWidth', 1.5, 'MarkerSize', 10);

title('Avalanche Sizes Follow Power Law');
xlabel('Avalanche size D(s)');
ylabel('No. of observed avalanches s');

grid on
set(gca, 'TickDir', 'out')
box off

% set up descriptive text
avalanche_desc_text = text(1, 1,...
    {'0 sand grains'; 
    [num2str(pile_width) 'x' num2str(pile_width) ' pile size']},...
    'HorizontalAlignment','right',...
    'BackgroundColor','w');

%% Set up sandpile plot
if draw_speed
    figure('position', [200 200 500 500]);
    set(gcf, 'Units', 'normal')
    set(gca, 'Position', [0 0 1 1])
    set(gcf, 'Color', [1 1 1])

    pile_img = image(zeros(pile_width));
    
    % set image-specific properties
    colormap(gray(5));
    xlim([0.5 pile_width+0.5]);
    ylim([0.5 pile_width+0.5]);
    set(gca, 'xtick', [],'ytick', []);
    
    % initialize patch for new grains
    pointer_patch = patch([0 0 0 0], [0 0 0 0], 0,...
        'EdgeColor', 'none', 'FaceColor', [244 165 130]/255);
else
    % draw_speed == 0, so we are not even plotting the sandpile
    pile_img = [];
    pointer_patch = [];
end
%------------- END CODE --------------
