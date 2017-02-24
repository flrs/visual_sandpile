function plotPile(pile_store, pile_store_add,pile_img, pointer_patch,...
    no_grains, avalanche_plt, avalanche_ct_plot, avalanche_desc_text,...
    draw_speed)
%plotPile - Plot the sandpile and a chart counting avalanche sizes
%The function plots all events happening in a single avalanche. The 
%function has been optimized for performance.
%
% Syntax: plotPile(pile_store, pile_store_add, no_grains, avalanche_plt,...
%    pointer_patch, pile_img, avalanche_ct_plot, avalanche_desc_text,...
%    draw_speed)
%
% Inputs:
%    pile_store - Pile history, matrix of shape (pile width, pile width,
%       no. of history time steps)
%    pile_store_add - Vector indicating locations of added grains in
%       history
%    pile_img - Handle to the image containing the sandpile
%    pointer_patch - Handle of the patch that shows where new grains have
%       been dropped
%    no_grains - Total count of grains added to sandpile so far
%    avalanche_plt - Vector containing counts of avalanche sizes
%    avalanche_ct_plot - Handle of avalanche counter plot
%    avalanche_desc_text - Handle of descriptive text on avalanche counter
%       plot
%    draw_speed - Speed of animation
%
% Outputs:
%    none
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: setupPlots
%
% Author: Florian Roscheck
% Website: http://github.com/flrs/visual_sandpile
% January 2017; Last revision: 27-January-2017

%------------- BEGIN CODE --------------

% plot pointer for new grain and sandpile
if draw_speed>0
    % pointer for new grain
    pile_width = size(pile_store(:, :, 1), 1);
    
    % fast ind2sub (see http://tipstrickshowtos.blogspot.com/2011/09/fast-r
    % eplacement-for-ind2sub.html, checked on 2017-01-26)
    add_row = rem(pile_store_add-1, pile_width)+1;
    add_col = (pile_store_add-add_row)/pile_width + 1;
    
    set(pointer_patch, 'XData',...
        [add_col-0.25 add_col-0.25  add_col+0.25 add_col+0.25],...
        'YData', [add_row+0.25 add_row-0.25 add_row-0.25 add_row+0.25]);
    
    drawnow
    
    pause(2*draw_speed) % pause for visualization
    
    set(pointer_patch, 'XData', 0, 'YData', 0); % hide new grain pointer
    
    % sandpile
    ct_goal = size(pile_store, 3); % show all avalanche time steps
    
    for ct = 1:ct_goal
        set(pile_img, 'cdata', pile_store(:, :, ct)+1);
        
        drawnow
        
        pause(draw_speed) % pause for visualization
    end
end

% plot avalanche chart
set(avalanche_ct_plot, 'XData', 1:numel(avalanche_plt),...
    'YData', avalanche_plt);

% update text in avalanche chart
figure(get(get(avalanche_ct_plot, 'Parent'), 'Parent'));

cur_xlim=xlim;
cur_ylim=ylim;
cur_string = get(avalanche_desc_text, 'String');
cur_string{1} = [num2str(no_grains) ' sand grains'];

set(avalanche_desc_text, 'position', [cur_xlim(2) cur_ylim(2) 0]);
set(avalanche_desc_text, 'String', cur_string);

drawnow;
%------------- END CODE --------------
