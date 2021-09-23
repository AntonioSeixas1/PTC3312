Kt = 0.0169;
T = 0.28;
n = 1/3;
Kp = 1.455;
omegaP = n^2.*Vt/Kt;

%f1 = figure;
%figure(f1)
%plot(t,Vm)

f2 = figure;
figure(f2)
plot(t,omegaP)
axis([0 30 0 30])
title('Rotacao no potenciometro')
xlabel('Tempo(s)')
ylabel('Wp (rad/s)')

wp1 = 12.1;
wp2 = 25.4;
Zinf = wp2 - wp1;

Vm1 = 2;
Vm2 = 4;
deltaVm = Vm2-Vm1;
K = Zinf/(n^2*deltaVm);

phi = K*n^2*Vm1 - wp1;

% Analisando a simulacao

f4 = figure;
figure(f4)
plot(tsim,Vmsim,tsim,Vtsim,t,Vt)
axis([0 30 0 5])
legend('Vm','Vt simulado','Vt real');  
title('Tensao no tacometro')
xlabel('Tempo(s)')
ylabel('Tensao(V)')

f5 = figure;
figure(f5)
plot(tsim,Vpsim,t,Vp)
axis([0 1.6 -2.0 5])
legend('Vt simulado','Vt real');  
title('Tensao no potenciometro')
xlabel('Tempo(s)')
ylabel('Tensao(V)')

% Comparando com os modelos das experiencias anteriores
f6 = figure;
figure(f6)
subplot(3,1,1)
plot(t,Vm)
axis([0 30 0 6])
atrito_sup = refline([0 0.2]);
atrito_sup.Color = 'r';
atrito_sup.LineStyle = '--';
sat_sup = refline([0 5]);
sat_sup.Color = 'g';
sat_sup.LineStyle = '--';
legend('Vm','Regiao de atrito','Vm de saturacao');  
title('Sinal de entrada')
xlabel('Tempo(s)')
ylabel('Tensao(V)')

subplot(3,1,2)
plot(t,Vt,tsim,Vtsim)
axis([0 30 0 8])
atrito_sup = refline([0 0.2]);
atrito_sup.Color = 'r';
atrito_sup.LineStyle = '--';
sat_sup = refline([0 5]);
sat_sup.Color = 'g';
sat_sup.LineStyle = '--';
legend('Vt','Vt simulado','Regiao de atrito','Vt de saturacao')
title('Resposta dinamica de velocidade')
xlabel('Tempo(s)')
ylabel('Tensao(V)')

subplot(3,1,3)
erro1 = Vtsim(1:2901,1) - Vt;
plot(t,erro1)
axis([0 30 -1 1])
title('Erro de modelagem')
xlabel('Tempo(s)')
ylabel('Vt_sim - Vt (V)')

f7 = figure;
figure(f7)
subplot(2,1,1)
plot(t,Vp,tsim,Vpsim)
axis([0 1.6 -2.0 6])
sat_sup = refline([0 5]);
sat_sup.Color = 'g';
sat_sup.LineStyle = '--';
legend({'Vp','Vp simulado','Vt de saturacao'},'Location','east')
title('Reposta dinamica de posicao')
xlabel('Tempo(s)')
ylabel('Tensao(V)')

erro2 = Vpsim(1:2901,1) - Vp;
subplot(2,1,2)
plot(t,erro2)
axis([0 1.6 -6 6])
title('Erro de modelagem')
xlabel('Tempo(s)')
ylabel('Vp_sim - Vp (V)')



