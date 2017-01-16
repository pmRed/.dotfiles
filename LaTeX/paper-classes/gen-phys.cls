%Prithvi's extension of the aps paper format.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gen-phys}[11/01/2017 Paper Class]

% Base Class Setup {{{
\LoadClass[aps, pra, twocolumn, superscriptaddress, showkeys]{revtex4-1}
%}}}

% Required Packages {{{

% Text
\RequirePackage{xcolor}         % Extended colors
\RequirePackage{microtype}      % Better kerning
\RequirePackage{hyperref}
\RequirePackage{lipsum}         % blindtext

% Mathematics
\RequirePackage{amsmath}        % Extended math
\RequirePackage{amssymb}        % Extended math symbols
\RequirePackage{amsfonts}       % Further fonts
\RequirePackage{bm}

% Physics
\RequirePackage{physics}

% Graphics

%\RequirePackage{graphicx}       % More graphics options
\RequirePackage{tikz}           % Custom diagrams within LaTeX

% Tables
\RequirePackage{dcolumn}

% Bibliography 

% Editing and scratch
\RequirePackage{todonotes}

%}}}

% Inline command redefinition {{{
\newcommand{\ee}{\mathrm{e}}
\newcommand{\ii}{\imath}
\newcommand{\ml}[1]{\left#1}
\newcommand{\mr}[1]{\right#1}
%}}}


% vim-run: make
% vim:foldmethod=marker:foldlevel=0 
