% Single-Sided Linear Indution Motor Model using MATLAB/S-Function

% State Variables x(1) = psi_sa, x(2) = psi_sb, x(3) = psi_ra, x(4) = psi_rb, x(5) = v;
% Inputs Variables u(1) = u_sa, u(2) = u_sb, u(3) = F_load;

function[sys,x0] = lim_model(t,x,u,flag)
switch flag
  case 0
      sys = [5;0;7;3;1;1];
      x0 = [0;0;0;0;0];
  case 1
      %Parameters
      Rs = 1.25;
      Rr = 2.7;
      Ls = 40.1e-3;
      Lr = 33.1e-3;
      Lm = 32.6e-3;
      tau = 0.066;
      p = 4;
      D = 0.286;
      m = 8;
      %Current calculation
      Q = abs(D*Rr/(Lr*x(5)));
      f = (1-exp(-Q))/Q;
      A = (Ls-Lm*f)*(Lr-Lm*f)-Lm^2*(1-f)^2;
      i_sa = ((Lr-Lm*f)*x(1)-Lm*(1-f)*x(3))/A;
      i_sb = ((Lr-Lm*f)*x(2)-Lm*(1-f)*x(4))/A;
      i_ra = -(Lm*(1-f)*x(1)-(Ls-Lm*f)*x(3))/A;
      i_rb = -(Lm*(1-f)*x(2)-(Ls-Lm*f)*x(4))/A;
      F = 3*pi*p/(2*tau*2)*(x(1)*i_sb-x(2)*i_sa);
      %Detervatives calculation
      dx(1) = u(1)-Rs*i_sa-Rr*f*(i_sa+i_ra);
      dx(2) = u(2)-Rs*i_sb-Rr*f*(i_sb+i_rb);
      dx(3) = -Rr*i_ra-Rr*f*(i_sa+i_ra)-pi/tau*x(5)*x(4);
      dx(4) = -Rr*i_rb-Rr*f*(i_sb+i_rb)+pi/tau*x(5)*x(3);
      dx(5) = (F-u(3))/m;
      sys = dx;
  case 3
      %Parameters
      Rs = 1.25;
      Rr = 2.7;
      Ls = 40.1e-3;
      Lr = 33.1e-3;
      Lm = 32.6e-3;
      tau = 0.066;
      p = 4;
      D = 0.286;
      m = 8;
      %Current calculation
      Q = abs(D*Rr/(Lr*x(5)));
      f = (1-exp(-Q))/Q;
      A = (Ls-Lm*f)*(Lr-Lm*f)-Lm^2*(1-f)^2;
      i_sa = ((Lr-Lm*f)*x(1)-Lm*(1-f)*x(3))/A;
      i_sb = ((Lr-Lm*f)*x(2)-Lm*(1-f)*x(4))/A;
      F = 3*pi*p/(2*tau*2)*(x(1)*i_sb-x(2)*i_sa);
      sys = [x(1); x(2); i_sa; i_sb; F; x(5); f];
  case {2, 4, 9}
    sys = [];
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end
