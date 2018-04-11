

---** 11.04.2018 **-----
---** Session 1   **----

-------------------------------------
restart
-- To get started with M2 we define the polynomial ring that we want to work with.
R=QQ[x,y,z]

x^2*y*z --- a monomial in R
xyz-- need to write * to multiply variables 

2*x^2*y*z-- a term in R
2x^2*x*y*z -- outputs error because * is missing after the 2

-- We can write polynomials in R and the system will known the element is  in the ring R
f= 2*x^2+x*y*z
g=x+y-1/2
w*x
-- we can define all the rings we want with the variable names as we like

S=QQ[a,b,c]
a -- an element of R
x -- an element of S
-- note that M2 knows which ring the polynomial belongs to.
-- Defining an ideal in M2 is straightforward

I= ideal(x,y,z) -- this is the ideal generated by x,y,z
Q= ideal(x,y,z,x*y)-- the generator x*y is redundant
mingens I
mingens Q
-- the minimal generators of the ideals I, Q are the same but the original generating sets
-- were different
J= ideal(a^3,b*a)
mingens J
-- the ideal J is an ideal of the ring S and M2 knows it.

-- M2 can help us know if a given element of R is an element of a given ideal in R
f=x^2*x*z+x*y-1
I=ideal(x,y,z)
f%I -- if output is zero then it is a member if output is not zero then it is not a member.
-- The algorithm for this command used Grobner bases.

------ Monomial Orders in M2 -----

restart
-- We specify the monomial ordering on the ring when we define the ring.
-- If no monomial order is specified then the default ordering is GRevLex.

R=QQ[x,y,z,MonomialOrder => Lex]
f=3*x^2*y^2+x^2*y*z^3
leadTerm f
leadTerm(x^2*y+x^3)

R=QQ[x,y,z,MonomialOrder => GLex]
f=3*x^2*y^2+x^2*y*z^3
leadTerm f
leadTerm(x^2*y+x^3)

R=QQ[x,y,z,MonomialOrder => GRevLex]
f=3*x^2*y^2+x^2*y*z^3
leadTerm f
leadTerm(x^2*y+x^3)

--- Polynomial division in M2 -----
restart

R=QQ[x,y, MonomialOrder => Lex]
f  = x^3*y^2+2*x*y^4
g1 = x^2*y^2-x
g2 = x*y^3+y

p=x*g1+2*y*g2+x^2-2*y^2

f%ideal(g1,g2)


-- Examples of Grobner Bases

restart
R=QQ[x,y,z,MonomialOrder=>Lex]

p  = x^2+1/2*y^2*z-z-1
f1 = x^2+z^2-1
f2 = x^2+y^2+(z-1)^2-4

leadTerm p
leadTerm f1
leadTerm f2
f1-f2
leadTerm(f1-f2)
leadTerm(ideal(f1,f2))
p%ideal(f1,f2)
