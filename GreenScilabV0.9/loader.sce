mode(-1);
lines(0);

stacksize(5E7);

global GL_SYS_DIR

GL_SYS_DIR=get_absolute_file_path('loader.sce');

chdir(GL_SYS_DIR); //change the current directory

if isdef('GreenLablib')//if the lib was alerady been built
   predef(0);
   clear GreenLablib
end

exec(GL_SYS_DIR+'/macros/gl_main.sci');

exec(GL_SYS_DIR+'/macros/Gl_StateOccupy.sci');

exec(GL_SYS_DIR+'/macros/gl_organ_axis.sci');
exec(GL_SYS_DIR+'/macros/gl_organ_axis_ori.sci');

exec(GL_SYS_DIR+'/macros/gl_env.sci');

exec(GL_SYS_DIR+'/macros/env_fun.sci');

exec(GL_SYS_DIR+'/macros/env_read_target.sci');

exec(GL_SYS_DIR+'/macros/gl_topo_phy.sci');

exec(GL_SYS_DIR+'/macros/gl_expan.sci');

exec(GL_SYS_DIR+'/macros/gl_demand.sci');

exec(GL_SYS_DIR+'/macros/gl_qorg.sci');

exec(GL_SYS_DIR+'/macros/gl_sizorg.sci');

exec(GL_SYS_DIR+'/macros/gl_resistance.sci');

exec(GL_SYS_DIR+'/macros/gl_photosynthsis.sci');

exec(GL_SYS_DIR+'/macros/gl_cross.sci');

exec(GL_SYS_DIR+'/macros/Draw_bending.sci');

exec(GL_SYS_DIR+'/macros/Draw_AngleShift.sci');

exec(GL_SYS_DIR+'/macros/Draw_GetOrgan.sci');

exec(GL_SYS_DIR+'/macros/Draw_AddOrgan.sci');

exec(GL_SYS_DIR+'/macros/Draw_SMB2ID.sci');

exec(GL_SYS_DIR+'/macros/Draw_ID2SMB.sci');

exec(GL_SYS_DIR+'/macros/Draw_read_organ.sci');

exec(GL_SYS_DIR+'/macros/Draw_Skeleton.sci');

exec(GL_SYS_DIR+'/macros/Draw_SMB.sci');

exec(GL_SYS_DIR+'/macros/Draw_3D.sci');

exec(GL_SYS_DIR+'/macros/Draw_Internode.sci');

exec(GL_SYS_DIR+'/macros/Draw_Fruit.sci');

exec(GL_SYS_DIR+'/macros/Draw_Lig.sci');


//for fitting
exec(GL_SYS_DIR+'/macros/sim_fit_Hidden.sci');

exec(GL_SYS_DIR+'/macros/sim_fit_HiddenPara_vec.sci');

disp('Building GreenLab liberary '+' in ' +GL_SYS_DIR+'macros')
genlib('GreenLablib',GL_SYS_DIR+'macros',%t)


//xdel(winsid()) //close all graphics window

[unit,err]=mopen(GL_SYS_DIR+'macros/lib','r');
mclose(unit);
//if err //liberary is not built
//   exec('builder.sce',-1); //build the liberary
//end

load(GL_SYS_DIR+'macros/lib')//load the liberary
disp('GreenScilab--Cultivating virtual plants in SciLab ...loaded. ');

GreeLabLIB=GL_SYS_DIR+'macros/';

//set old_style on


if 1
  SEPARATOR='\';
  libfilename='/libSci_c.dll';
else
  SEPARATOR='/';
  libfilename='/libSci_c.so';
end
  
TCL_EvalFile('inter_main.tcl')


// generated by builder.sce: Please do not edit this file
// ------------------------------------------------------
libSci_c_path=get_file_path('loader.sce');
functions=[ 'topo';
            'qorg';
            'sizorg';
            'PSO_fit';
];
addinter(libSci_c_path+'/libSci_c.dll','libSci_c',functions);
