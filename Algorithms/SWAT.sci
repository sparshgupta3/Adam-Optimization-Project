function f=funcx(x)
    f=100*((x(2) - x(1).^2).^2) + (x(1) - 1).^2;
endfunction

function g=grad(x)
    g=[-400*x(1)*(x(2) - x(1).^2) + 2*(x(1) - 1);200 * (x(2) - x(1).^2)];
endfunction

x = [4;4];
al = 0.001;
b1 = 0.9;
b2 = 0.99;
ep = 0.000000001;
phase = "ADAM";
d = 1;
k = 0;
mprev = 0;
aprev = 0;
lprev = 0;
//vprev =0;
while(d>ep)
    k = k+1;
    g = grad(x);
    if phase == "SGD" then
        vnew = b1*vprev + g;
        xnew = x - (1-b1)*delta*vnew;
        vprev = vnew;
        d = abs(funcx(xnew) - funcx(x));
         x = xnew;
        continue;
    end
    mnew = b1*mprev + (1-b1)*g;
    anew = b2*aprev + (1-b2)*(g'*g);
   // p = -al * (sqrt(1-b2^k)) * (mnew) / ((1-b1^k)*(sqrt(anew) + ep));
    p = -al * (mnew / (1-b1^k)) / (sqrt((anew)/(1-b2^k)) + ep);
    xnew = x + p;
    if (p'*g <> 0) then
        gam = p'*p / ((-1*p')*g);
        lnew = b2*lprev + (1-b2)*gam;
        if (k>1 & (abs(lnew/(1-b2^k) - gam) < ep)) then
           phase = "SGD";
           vprev = 0; 
           delta = lnew/(1-b2^k);
           disp(k);
           disp(xnew);
        end
    else    
        lnew = lprev;
    end
    lprev = lnew;
    aprev = anew;
    mprev = mnew;
    d = abs(funcx(xnew) - funcx(x));
    x = xnew;
end
disp(x);
disp(funcx(x));
