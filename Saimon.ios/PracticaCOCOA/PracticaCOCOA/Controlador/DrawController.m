//
//  DrawController.m
//  PracticaCOCOA
//
//  Created by Alumno on 22/10/19.
//  Copyright © 2019 USAL. All rights reserved.
//

#import "DrawController.h"
#import "Controller.h"
#define THICKNESS 15


@implementation DrawController


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    NSRect bounds = [self bounds]; //Dimensiones vista
    [[NSColor purpleColor]set];      //ColorFondo de la vista
    [NSBezierPath fillRect:bounds]; //Se dibujan los limites de la lista
                                    //y se rellena la vista
    
    
    NSGraphicsContext * ctx = [NSGraphicsContext currentContext]; 
    [controlador muestraCuadrado:bounds
                withGraphicsContext:ctx ];
}


@end
