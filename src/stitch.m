function ims = stitch(src, dst, H)
    tf = maketform('projective',H');
    [im1t,xdataim2t,ydataim2t]=imtransform(src,tf);
    % now xdataim2t and ydataim2t store the bounds of the transformed im2
    xdataout=[min(1,xdataim2t(1)) max(size(dst,2),xdataim2t(2))];
    ydataout=[min(1,ydataim2t(1)) max(size(dst,1),ydataim2t(2))];
    % let's transform both images with the computed xdata and ydata
    im1t=imtransform(src,tf,'XData',xdataout,'YData',ydataout);
    im2t=imtransform(dst,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);
    
    ims=max(im1t,im2t);
end