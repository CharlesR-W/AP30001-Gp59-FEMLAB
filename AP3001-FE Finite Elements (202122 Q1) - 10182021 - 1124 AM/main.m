clear all

%% INPUT DATA
%Test1
coeffs = @(x,y) 0;
g=@(x,y) x+y;


% Real problem
% Parameters:
f_micro = 2.45e8;
omega = 2*pi*f_micro;

eps_air = 8.85e-12;
sig_air=0;
mu_air=pi*4e-7;

eps_ch=4.43e-11;
sig_ch=3e-11;
mu_ch=pi*4e-7;

% TODO: Define function coeffs
material = @(x,y) [x^2+y^2 < 0.5]; % 1 if chicken, 0 if not
coeffs = @(x,y) omega^2 * ( ...
    material(x,y) * mu_ch *(eps_ch - 1i * sig_ch / omega) ...
    + (1-material(x,y)) * mu_air * (eps_air - 1i * sig_air / omega) ...
    );
% TODO: Define function g
TOL = 1e-10;

%Original (rectangular) source
micro_source = @(x,y) [abs(x-1) < TOL && abs(y) <= 0.5]; % original source

%Circular source:
%micro_source = @(x,y) [atan2(y,x) <= pi/8 && atan2(y,x) >= 0];
g = @(x,y) micro_source(x,y) * 100;


%% RUN CODE
AP3001Mesh1
AP3001Comp1
AP3001Post1
