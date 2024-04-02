# Bisection Method

using Plots
Plots.default(show = true)

function bisection(f,a,b,max_iter,err,tol)
    if sign(f(a)) == sign(f(b))
        error("f(a) and f(b) must have opposite signs")
    end
    u = f(a)
    v = f(b)
    e = b-a
    for k = 1:max_iter
        e = e/2
        c = a + e
        w = f(c)
        if abs(e) < tol || abs(w) < err
            return c
        end
        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
    return c
end

c = bisection(x -> x^3 - 10, -5, 10, 100, 1e-6, 1e-6)

print("The root is: ", c, "\n")

f(x) = x^3 - 10
p = plot(f, -5, 5, label="f(x) = x^3 - 10", legend=:topleft)
p = plot!(zero, -5, 5, label="x-axis")
title!("Bisection Method function example")
savefig(p,"functionExample.png")
display(p)
readline()