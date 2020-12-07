/* File: store.c
 *
 * This file is part of XSCHEM,
 * a schematic capture and Spice/Vhdl/Verilog netlisting tool for circuit
 * simulation.
 * Copyright (C) 1998-2020 Stefan Frederik Schippers
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "xschem.h"


void check_wire_storage(void)
{
 if(xctx->wires >= xctx->maxw)
 {
  xctx->maxw=(1+xctx->wires / CADMAXWIRES)*CADMAXWIRES;
  my_realloc(392, &xctx->wire, sizeof(xWire)*xctx->maxw);
 }
}

void check_selected_storage(void)
{
 if(xctx->lastsel >= xctx->maxsel)
 {
  xctx->maxsel=(1+xctx->lastsel / MAXGROUP) * MAXGROUP;
  my_realloc(393, &xctx->sel_array, sizeof(Selected)*xctx->maxsel);
 }
}

void check_text_storage(void)
{
 if(xctx->texts >= xctx->maxt)
 {
  xctx->maxt=(1 + xctx->texts / CADMAXTEXT) * CADMAXTEXT;
  my_realloc(394, &xctx->text, sizeof(xText)*xctx->maxt);
 }
}

void check_symbol_storage(void)
{
 int i;
 if(xctx->symbols >= xctx->maxs)
 {
  dbg(1, "check_symbol_storage(): more than maxs, %s\n",
        xctx->sch[xctx->currsch] );
  xctx->maxs=(1 + xctx->symbols / ELEMDEF) * ELEMDEF;
  my_realloc(395, &xctx->sym, sizeof(xSymbol)*xctx->maxs);
  for(i=xctx->symbols;i<xctx->maxs;i++) {
    xctx->sym[i].poly=my_calloc(68, cadlayers, sizeof(xPoly *));
    if(xctx->sym[i].poly==NULL){
       fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }

    xctx->sym[i].arc=my_calloc(396, cadlayers, sizeof(xArc *));
    if(xctx->sym[i].arc==NULL){
       fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }

    xctx->sym[i].line=my_calloc(397, cadlayers, sizeof(xLine *));
    if(xctx->sym[i].line==NULL){
       fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }

    xctx->sym[i].rect=my_calloc(398, cadlayers, sizeof(xRect *));
    if(xctx->sym[i].rect==NULL){
      fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }

    xctx->sym[i].lines=my_calloc(399, cadlayers, sizeof(int));
    if(xctx->sym[i].lines==NULL){
      fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }

    xctx->sym[i].rects=my_calloc(400, cadlayers, sizeof(int));
    if(xctx->sym[i].rects==NULL){
      fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }
    xctx->sym[i].polygons=my_calloc(401, cadlayers, sizeof(int));
    if(xctx->sym[i].polygons==NULL){
      fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }
    xctx->sym[i].arcs=my_calloc(66, cadlayers, sizeof(int));
    if(xctx->sym[i].arcs==NULL){
      fprintf(errfp, "check_symbol_storage(): calloc error\n");tcleval( "exit");
    }
  }
 }

}

void check_inst_storage(void)
{
 if(xctx->instances >= xctx->maxi)
 {
  xctx->maxi=(1 + xctx->instances / ELEMINST) * ELEMINST;
  my_realloc(402, &xctx->inst, sizeof(xInstance)*xctx->maxi);
 }
}

void check_arc_storage(int c)
{
 if(xctx->arcs[c] >= xctx->maxa[c])
 {
  xctx->maxa[c]=(1 + xctx->arcs[c] / CADMAXOBJECTS) * CADMAXOBJECTS;
  my_realloc(403, &xctx->arc[c], sizeof(xArc)*xctx->maxa[c]);
 }
}

void check_box_storage(int c)
{
 if(xctx->rects[c] >= xctx->maxr[c])
 {
  xctx->maxr[c]=(1 + xctx->rects[c] / CADMAXOBJECTS) * CADMAXOBJECTS;
  my_realloc(404, &xctx->rect[c], sizeof(xRect)*xctx->maxr[c]);
 }
}

void check_line_storage(int c)
{
 if(xctx->lines[c] >= xctx->maxl[c])
 {
  xctx->maxl[c]=(1 + xctx->lines[c] / CADMAXOBJECTS) * CADMAXOBJECTS;
  my_realloc(405, &xctx->line[c], sizeof(xLine)*xctx->maxl[c]);
 }
}

void check_polygon_storage(int c)
{
 if(xctx->polygons[c] >= xctx->maxp[c])
 {
  xctx->maxp[c]=(1 + xctx->polygons[c] / CADMAXOBJECTS) * CADMAXOBJECTS;
  my_realloc(406, &xctx->poly[c], sizeof(xPoly)*xctx->maxp[c]);
 }
}

void store_arc(int pos, double x, double y, double r, double a, double b,
               unsigned int rectc, unsigned short sel, char *prop_ptr)
{
  int n, j;
  const char *dash;
  check_arc_storage(rectc);
  if(pos==-1) n=xctx->arcs[rectc];
  else
  {
   for(j=xctx->arcs[rectc];j>pos;j--)
   {
    xctx->arc[rectc][j]=xctx->arc[rectc][j-1];
   }
   n=pos;
  }
  xctx->arc[rectc][n].x = x;
  xctx->arc[rectc][n].y = y;
  xctx->arc[rectc][n].r = r;
  xctx->arc[rectc][n].a = a;
  xctx->arc[rectc][n].b = b;
  xctx->arc[rectc][n].prop_ptr = NULL;
  my_strdup(407, &xctx->arc[rectc][n].prop_ptr, prop_ptr);
  xctx->arc[rectc][n].sel = sel;
  if( !strcmp(get_tok_value(xctx->arc[rectc][n].prop_ptr,"fill",0),"true") )
    xctx->arc[rectc][n].fill =1;
  else
    xctx->arc[rectc][n].fill =0;
  dash = get_tok_value(xctx->arc[rectc][n].prop_ptr,"dash",0);
  if( strcmp(dash, "") ) {
    int d = atoi(dash);
    xctx->arc[rectc][n].dash = d >= 0 ? d : 0;
  } else
    xctx->arc[rectc][n].dash = 0;

  xctx->arcs[rectc]++;
  set_modify(1);
}

void store_poly(int pos, double *x, double *y, int points, unsigned int rectc, 
                unsigned short sel, char *prop_ptr)
{
  int n, j;
  const char *dash;
  check_polygon_storage(rectc);
  if(pos==-1) n=xctx->polygons[rectc];
  else
  {
   for(j=xctx->polygons[rectc];j>pos;j--)
   {
    xctx->poly[rectc][j]=xctx->poly[rectc][j-1];
   }
   n=pos;
  }
  dbg(2, "store_poly(): storing POLYGON %d\n",n);

  xctx->poly[rectc][n].x=NULL;
  xctx->poly[rectc][n].y=NULL;
  xctx->poly[rectc][n].selected_point=NULL;
  xctx->poly[rectc][n].prop_ptr=NULL;
  xctx->poly[rectc][n].x= my_calloc(408, points, sizeof(double));
  xctx->poly[rectc][n].y= my_calloc(409, points, sizeof(double));
  xctx->poly[rectc][n].selected_point= my_calloc(410, points, sizeof(unsigned short));
  my_strdup(411, &xctx->poly[rectc][n].prop_ptr, prop_ptr);
  for(j=0;j<points; j++) {
    xctx->poly[rectc][n].x[j] = x[j];
    xctx->poly[rectc][n].y[j] = y[j];
  }
  xctx->poly[rectc][n].points = points;
  xctx->poly[rectc][n].sel = sel;


  if( !strcmp(get_tok_value(xctx->poly[rectc][n].prop_ptr,"fill",0),"true") )
    xctx->poly[rectc][n].fill =1;
  else
    xctx->poly[rectc][n].fill =0;
  dash = get_tok_value(xctx->poly[rectc][n].prop_ptr,"dash",0);
  if( strcmp(dash, "") ) {
    int d = atoi(dash);
    xctx->poly[rectc][n].dash = d >= 0 ? d : 0;
  } else
    xctx->poly[rectc][n].dash = 0;


  xctx->polygons[rectc]++;
  set_modify(1);
}

void storeobject(int pos, double x1,double y1,double x2,double y2,
                 unsigned short type, unsigned int rectc,
                 unsigned short sel, const char *prop_ptr)
{
 int n, j;
 const char * dash;
    if(type == LINE)
    {
     check_line_storage(rectc);

     if(pos==-1) n=xctx->lines[rectc];
     else
     {
      for(j=xctx->lines[rectc];j>pos;j--)
      {
       xctx->line[rectc][j]=xctx->line[rectc][j-1];
      }
      n=pos;
     }
     dbg(2, "storeobject(): storing LINE %d\n",n);
     xctx->line[rectc][n].x1=x1;
     xctx->line[rectc][n].x2=x2;
     xctx->line[rectc][n].y1=y1;
     xctx->line[rectc][n].y2=y2;
     xctx->line[rectc][n].prop_ptr=NULL;
     my_strdup(412, &xctx->line[rectc][n].prop_ptr, prop_ptr);
     xctx->line[rectc][n].sel=sel;
     if( prop_ptr && !strcmp(get_tok_value(prop_ptr, "bus", 0), "true") )
       xctx->line[rectc][n].bus = 1;
     else
       xctx->line[rectc][n].bus = 0;
     if(prop_ptr && (dash = get_tok_value(prop_ptr,"dash",0))[0]) {
       int d = atoi(dash);
       xctx->line[rectc][n].dash = d >= 0 ? d : 0;
     } else
       xctx->line[rectc][n].dash = 0;
     xctx->lines[rectc]++;
     set_modify(1);
    }
    if(type == xRECT)
    {
     check_box_storage(rectc);
     if(pos==-1) n=xctx->rects[rectc];
     else
     {
      for(j=xctx->rects[rectc];j>pos;j--)
      {
       xctx->rect[rectc][j]=xctx->rect[rectc][j-1];
      }
      n=pos;
     }
     dbg(2, "storeobject(): storing RECT %d\n",n);
     xctx->rect[rectc][n].x1=x1;
     xctx->rect[rectc][n].x2=x2;
     xctx->rect[rectc][n].y1=y1;
     xctx->rect[rectc][n].y2=y2;
     xctx->rect[rectc][n].prop_ptr=NULL;
     my_strdup(413, &xctx->rect[rectc][n].prop_ptr, prop_ptr);
     xctx->rect[rectc][n].sel=sel;
     if(prop_ptr && (dash = get_tok_value(prop_ptr,"dash",0))[0]) {
       int d = atoi(dash);
       xctx->rect[rectc][n].dash = d >= 0 ? d : 0;
     } else
       xctx->rect[rectc][n].dash = 0;
     xctx->rects[rectc]++;
     set_modify(1);
    }
    if(type == WIRE)
    {
     check_wire_storage();
     if(pos==-1) n=xctx->wires;
     else
     {
      for(j=xctx->wires;j>pos;j--)
      {
       xctx->wire[j]=xctx->wire[j-1];
      }
      n=pos;
     }
     dbg(2, "storeobject(): storing WIRE %d\n",n);
     xctx->wire[n].x1=x1;
     xctx->wire[n].y1=y1;
     xctx->wire[n].x2=x2;
     xctx->wire[n].y2=y2;
     xctx->wire[n].prop_ptr=NULL;
     xctx->wire[n].node=NULL;
     xctx->wire[n].end1=0;
     xctx->wire[n].end2=0;
     my_strdup(414, &xctx->wire[n].prop_ptr, prop_ptr);
     if(prop_ptr && !strcmp(get_tok_value(prop_ptr,"bus",0), "true")) xctx->wire[n].bus=1;
     else xctx->wire[n].bus=0;
     xctx->wire[n].sel=sel;
     xctx->wires++;
     set_modify(1);
    }
}

void freenet_nocheck(int i)
{
 int j;
  my_free(959, &xctx->wire[i].prop_ptr);
  my_free(960, &xctx->wire[i].node);
  for(j=i+1;j<xctx->wires;j++)
  {
    xctx->wire[j-1] = xctx->wire[j];
    xctx->wire[j].prop_ptr=NULL;
    xctx->wire[j].node=NULL;
  } /*end for j */
  xctx->wires--;
}

