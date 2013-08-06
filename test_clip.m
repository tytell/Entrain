fsamp = 10000;
dt = 1/fsamp;
maxvel = 300;
maxacc = 2e5;
kpos = 1;
kvel = 0.5;

t = 0:dt:2;

ftri = 10;
amptri = 10;

V = zeros(size(t));
V(mod(t*ftri,1) < 0.5) = 2*amptri*ftri;
V(mod(t*ftri,1) > 0.5) = -2*amptri*ftri;
P = cumtrapz(t,V);

[pact,vact] = clip_signal(P,V*dt, maxvel*dt,maxacc*dt^2, kpos,kvel);
vact = vact/dt;

subplot(2,1,1);
plot(t,P, t,pact);

subplot(2,1,2);
plot(t,V, t,vact);

prmse = sqrt(mean((pact - P).^2));
vrmse = sqrt(mean((vact - V).^2));

fprintf('prmse = %f\nvrmse = %f\n', prmse, vrmse);


