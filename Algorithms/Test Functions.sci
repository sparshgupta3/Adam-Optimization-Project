//Sphere Function
function f = funcx(x)
    f = x(1)^2 + x(2)^2;
endfunction
function g = grad(x)
    g = [2*x(1);2*x(2)];
endfunction

//Rosenbrock Function or Banana Function
function f = funcx(x)
    f = 100*((x(2) - x(1).^2).^2) + (x(1) - 1).^2;;
endfunction
function g = grad(x)
    g = [-400*x(1)*(x(2) - x(1).^2) + 2*(x(1) - 1);200 * (x(2) - x(1).^2)];;
endfunction

//Beale Function
function f = funcx(x)
    f = (1.5-x(1)+x(1)*x(2))^2+(2.25-x(1)+x(1)*x(2)^2)^2+(2.625-x(1)+x(1)*(x(2)^3))^2;
endfunction
function g = grad(x)
    g = [2*((1.5-x(1)+x(1)*x(2))*(-1+x(2))+(2.25-x(1)+x(1)*x(2)^2)*(-1+x(2)^2)+(2.625-x(1)+x(1)*(x(2)^3))*(-1+x(2)^3));2*((1.5-x(1)+x(1)*x(2))*x(1)+(2.25-x(1)+x(1)*x(2)^2          )*(2*x(1)*x(2))+(2.625-x(1)+x(1)*(x(2)^3))*(3*x(1)*x(2)^2))];
endfunction

//Matyas Function
function f = funcx(x)
    f = 0.26*(x(1)^2 + x(2)^2)-0.48*x(1)*x(2);
endfunction
function g = grad(x)
    g = [0.26*2*x(1)-0.48*x(2);0.26*x(2)*2-0.48*x(1)];
endfunction

//Booth Function
function f = funcx(x)
    f = (x(1)+2*x(2)-7)^2 + (2*x(1)+x(2)-5)^2;
endfunction
function g = grad(x)
    g = [2*(x(1)+2*x(2)-7)+4*(2*x(1)+x(2)-5);4*(x(1)+2*x(2)-7)+2*(2*x(1)+x(2)-5)^2];
endfunction
