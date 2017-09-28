f = @(a) @(x) exp(x) + x^a + x^(sqrt(x)) - 100
format long
aa = 0:0.01:2;
plot(aa,arrayfun(@(a) fzero(f(a),4),aa),'* -')
xlabel('$ a $','interpreter','latex','fontsize',15)
ylabel('$ x $','interpreter','latex','fontsize',15)
title('$ \mathrm{e}^x + x^{\sqrt{x}} + x^a - 100 $','interpreter','latex','fontsize',15)