figure;
trisurf(elmat,x,y,real(u))

figure;
trisurf(elmat,x,y,real(u))
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer')
