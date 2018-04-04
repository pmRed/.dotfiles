%Prithvi's extension of the aps paper format.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{org-cls}[11/01/2017 Paper Class]

% Base Class Setup {{{
\LoadClass[aps,showpacs,showkeys,pra,superscriptaddress,notitlepage]{revtex4-1}
%}}}

% Required Packages {{{

% Text
\RequirePackage{xcolor}         % Extended colors
\RequirePackage{microtype}      % Better kerning
\RequirePackage{hyperref}
\RequirePackage{lipsum}         % blindtext
\RequirePackage{enumitem}

% Mathematics
\RequirePackage{amsmath}        % Extended math
\RequirePackage{amssymb}        % Extended math symbols
\RequirePackage{amsfonts}       % Further fonts
\RequirePackage{bm}
\RequirePackage{autobreak}

% Physics
\RequirePackage{physics}
\RequirePackage{braket}

% Graphics
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{tikz}           % Custom diagrams within LaTeX

% Tables
\RequirePackage{dcolumn}
\RequirePackage{booktabs}

% Bibliography 

% Editing and scratch
\RequirePackage{todonotes}

%}}}

% {{{
%}}}

% Inline command redefinition {{{
\newcommand{\ee}{\mathrm{e}}
\newcommand{\ii}{\imath}
\newcommand{\ml}[1]{\left#1}
\newcommand{\mr}[1]{\right#1}
\newcommand{\dvec}{\vec}
%}}}

% Custom symbols {{{
\newcommand{\tens}{\bm}
%}}}
