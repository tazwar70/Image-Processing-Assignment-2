I=imread('test2.jpg')
G=rgb2gray(I);
edge_image=edge(G,'canny')
theta_sample_frequency=0.01;
r = 30;% define the radius
[x,y] = size(edge_image);
xmin = 0 - r;
xmax = x + r;
ymin = 0 - r;
ymax = y + r;
a = (xmin:1:xmax);
b = (ymin:1:ymax);
theta_sample_freq = 0.01;
theta = (0:theta_sample_freq:2*pi);
num_a = numel(a);%define the range of x
num_b= numel(b);%define the range of y
num_theta = numel(theta);%define the theta
acc= zeros(num_a, num_b);%define the accumulator
for xi = 1:x
    for yj = 1:y
         if edge_image(xi,yj) == 1
              for theta_id = 1:num_theta
                   th = theta(theta_id);
                   a_id = round((xi - r*cos(th))+r);
                   b_id = round((yj - r*sin(th))+r);
                   acc(a_id, b_id) = acc(a_id, b_id) + 1;
              end
          end
     end
end
figure
imshow(G)
hold on
[M,I]= max(acc(:));
[a_id, b_id]= ind2sub(size(acc), I);
thet = 0:pi/6:2*pi;
xunit = r*cos(thet)+a(a_id);
yunit = r*sin(thet)+b(b_id);
plot(yunit, xunit, 'o', 'LineWidth', 2);
