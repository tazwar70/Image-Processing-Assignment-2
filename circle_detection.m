function circle = circle_detection(I,r)
    % Convert to Gray
    image_gray = rgb2gray(I);

    % Edge Detection
    image_edge = edge(image_gray,'canny');

    % Parameterization
    [x, y] = size(image_edge);
    a = (0 - r:1:x + r);
    b = (0 - r:1:y + r);
    theta_sample_freq = 0.01;
    theta = (0:theta_sample_freq:2*pi);
    num_theta = numel(theta);
    acc= zeros(numel(a), numel(b));

    % Perform Hough Transform
    for xi = 1:x
        for yj = 1:y
             if image_edge(xi,yj) == 1
                  for theta_id = 1:num_theta
                       theta_max = theta(theta_id);
                       a_id = round((xi - r*cos(theta_max))+r);
                       b_id = round((yj - r*sin(theta_max))+r);
                       acc(a_id, b_id) = acc(a_id, b_id) + 1;
                  end
              end
         end
    end

    % Extract the Parameters
    [M,I]= max(acc(:));
    [a_id, b_id]= ind2sub(size(acc), I);
    x_id = r*cos(theta) + a(a_id);
    y_id = r*sin(theta) + b(b_id);

    % Plot Detected Circles
    imshow(image_gray)
    hold on
    plot(y_id, x_id, 'r', 'LineWidth', 3),title("Radius = " + int2str(r))
