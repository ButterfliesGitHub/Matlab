inf_u=50
inf_v=50
mm = 50
nn = 15
figure;
[UI,VI] = meshgrid((inf_u/mm:inf_u/mm:inf_u),(inf_v/mm:inf_v/mm:inf_v))
surf(UI,VI)
hold on
[U,V] = meshgrid(linspace(inf_u/mm,inf_u,nn),linspace(inf_v/mm,inf_v,nn))
surf(U,V)