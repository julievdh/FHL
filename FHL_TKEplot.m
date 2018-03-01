% FHL_TKEplot

for i=1:2 %i index corresponds to grid type
%     for j=1:length(rpms) %j index corresponds to motor rpm
%         i;
%         j;
        %Make syntax easier to work with
        u=eval([label{i},rpms{j},'_u']);
        v=eval([label{i},rpms{j},'_v']);
        x=eval([label{i},rpms{j},'_x']);
        y=eval([label{i},rpms{j},'_y']);
        vort=eval([label{i},rpms{j},'_vort']);
        enst=vort.*vort;
        
        %Find dimensions of variable arrays
        H=size(u,1);
        L=size(u,2);
        T=size(u,3);
        dx=abs(x(1,1,1)-x(1,2,1));
        dy=abs(y(1,1,1)-y(2,1,1));
        
        %Find temporal means of u and v
        %u_mean is a 2D array, averaged in time through 3rd dimension of u
        u_mean=median(u,3);
        v_mean=median(v,3);
        
        %Save mean u and mean v for later plot titles
        mean_u(i,j)=median(u_mean(isfinite(u_mean)));
        mean_v(i,j)=median(v_mean(isfinite(v_mean)));
        
        %Calculate Reynolds-decomposed fluctuations
        %u_prime is a 3D array (3rd dimension is frame number)
        temp_umean=repmat(u_mean,[1 1 T]);%tile u_mean to match dimensions
        temp_vmean=repmat(v_mean,[1 1 T]);%tile v_mean to match dimensions
        u_prime=u-temp_umean;
        v_prime=v-temp_vmean;
        
        clear temp_umean temp_vmean
        
        %Find TKE for each frame at each point
        for t=1:size(u,3)
            u_T=0.5.*((u_prime(:,:,t).^2+v_prime(:,:,t).^2).^0.5);%Turbulent velocity scale (u_T is 2D array)
            TKE(:,:,t)=1.5*u_T.^2;%Find TKE matrix for this frame (TKE is 2D array)
            
            clear u_T
        end
        
        %Time-average TKE and store
        TKE_master{i,j}=median(TKE,3);
        
        %Define axes for plotting
        xmin=0;
        xmax=L*dx;
        ymin=(-H/2)*dy;
        ymax=(H/2)*dy;
        X=x(:,:,1);
        Ycol=(ymin+dy/2):dy:(ymax-dy/2);
        Y=repmat(Ycol',1,L);
        cscale=5*median(median(TKE_master{i,j}));
        
        % PLOTTING RESULTS
        figure
        pcolor(X,Y,TKE_master{i,j})
        shading flat
        caxis([0 cscale])
        colorbar
        xlabel('Distance Along Tunnel [m]','FontSize',14)
        ylabel('Distance from Tunnel Midline [m]','FontSize',14)
        title(['TKE for U=',num2str(mean_u(i,j)),' Condition=',label{i}],'FontSize',14)
        clear TKE cscale Y Ycol X xmin xmax ymin ymaxfg
end
