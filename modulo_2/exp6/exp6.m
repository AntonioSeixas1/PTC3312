T = 0.27;
Ti = T;
Kpi = 4;
Kt = 0.0169;
Kp = 1.455;
KNL = 59.85;
K = 55.0201;
phi = 1.2;
n = 1/3;

Gmd = tf([K*Kt*Kpi*Ti K*Kt*Kpi],[T*Ti Ti 0]);
rlocus(Gmd)

wp = 100*2*pi/60;
wm = wp/n^2;
degrau = wm/K;

subplot(3,1,1)
plot(tout,entrada(1:1000),tout,Vt_sim1(1:1000),tout,Vt_sim2(1:1000))
%title('Kc=1.5')
axis([0 5 -0.5 2])
legend('Entrada','Vt linear','Vt nao linear')
xlabel('Tempo(s)')
ylabel('Vt(V)')

subplot(3,1,2)
plot(tout,Vm_L(1:1000),tout,Vm_NL(1:1000))
axis([0 5 -0.5 5])
atrito_sup = refline([0 0.2]);
atrito_sup.Color = 'r';
atrito_sup.LineStyle = '--';
legend('Vm linear','Vm nao linear','Vm atrito superior')
xlabel('Tempo(s)')
ylabel('Vm(V)')

erro_linear = entrada-Vt_sim2;
erro_naolinear = entrada-Vt_sim1;

subplot(3,1,3)
plot(tout,erro_linear(1:1000),tout,erro_naolinear(1:1000))
axis([0 5 -0.5 2])
legend('Erro linear','Erro nao linear')
xlabel('Tempo(s)')
ylabel('Erro(V)')

pontos = (tout>3);
Vt_inf = mean(Vt_sim1);
Vt_T = 0.63*Vt_inf;
Tnao_lin = tout(Vt_sim1 < Vt_T*1.03 & Vt_sim1 > Vt_T*0.97) - 1;

Vt_inf = mean(Vt_sim2);
Vt_T = 0.63*Vt_inf;
Tlin = tout(Vt_sim2 < Vt_T*1.03 & Vt_sim2 > Vt_T*0.97) - 1;
