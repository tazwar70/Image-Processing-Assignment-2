% im = imread('test2.jpg');
% im = rgb2gray(im);
% [rows, columns] = size(im);
% % Range of radius to be analized
% rstart = 30;
% rmax = 32;
% % Accumulator
% acc = zeros(rows,columns,rmax-rstart);
% for x=1:columns
%   for y=1:rows
%   if im(y,x)<=10    
%  %fprintf('Point detected at [%i,%i]\n',y,x);
%           % Iterate over the range of radius
%           for r=1:rmax-rstart
%               for angle=0:360
%                   radius = r+rstart;
%                   t = angle*pi/180;
%                   % Generate the coordinates
%                   x0 = round(x-radius*cos(t));
%                   y0 = round(y-radius*sin(t));
%                   radiusinside=r;
%                   if (x0<columns && x0>0 && y0<rows && y0>0)
%                       acc(y0,x0,r) = acc(y0,x0,r)+1;
%                   end
%               end
%           end     
%       end
%   end   
% end
% figure, imshow(im);
% afterloop=r;
% th = 0:pi/50:2*pi;
% % Obtain the coordinates of the maximum value of the accumulator
% larger_number=max(max(max(acc(:))));
% postion_largnum=find(acc(:) == larger_number);
% [y,x,r]=ind2sub(size(acc),postion_largnum);
% % Draw over the picture the generated circle
% r= r + rstart;
% hold on
% xunit = r * cos(th) + x;
% yunit = r * sin(th) + y;
% plot(xunit, yunit,'LineWidth',2);

% image = ;
circle_detection(imread('test2.jpg'),25)