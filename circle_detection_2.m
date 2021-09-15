function circle = circle_detection(image,r)
    % Convert to Gray
    image_gray = rgb2gray(image);

    % Edge Detection
    image_edge = edge(image_gray,'canny');

    % Finding the circles
    rmin = r-5;
    rmax = r+5;
    rrange = [rmin rmax];
    [centers,radii] = imfindcircles(image_edge,rrange);

    % Displaying the circles
    imshow(image_gray)
    viscircles(centers,radii,'EdgeColor','b');