//
//  Figura.m
//  PracticaCOCOA
//
//  Created by alumno5 on 24/10/2019.
//  Copyright © 2019 USAL. All rights reserved.
//

#import "Figura.h"
#import "Controller.h"

@implementation Figura

#define XDIMENSION 400
#define YDIMENSION 400
#define MAXDIMENSION 200
#define DESPX 100
#define GROSORL 200

static NSRect funcRect = {-XDIMENSION,-YDIMENSION,2*XDIMENSION,2*YDIMENSION};

@synthesize cuadraditoColor,colorRelleno;



-(id) initWithRect: (NSRect) cuadrado
         withColor:(NSColor *) colorRelleno{
    
    self = [super init];
    if (!self) {
        return nil; }
    rectPath = [[NSBezierPath alloc] init];
    [self setCuadraditoColor:cuadrado];
    [self setColorRelleno:colorRelleno];
    [rectPath appendBezierPathWithRect:[self cuadraditoColor]];
    return self;
}


//EN LAS SIGUIENTES 4 FUNCIONES SE ALMACENA LA POSICION Y EL COLOR QUE TENDRÁ CADA CUADRADO

//ROJO
+(id)rectanguloRojo{

    NSRect rect;
    Figura *cuadradito;
    
    rect.origin.x=funcRect.origin.x;
    rect.origin.x=funcRect.origin.y;
    rect.size.width=40;
    rect.size.height=40;
    
    //Almacenamos los valores que son rect con sus dimensiones y con el color rojo
    cuadradito=[[Figura alloc] initWithRect:rect withColor: [NSColor redColor]];
    
    
    return cuadradito;
}


//VERDE
+(id)rectanguloVerde{
 
 NSRect rect;
 Figura *cuadradito;
 
 rect.origin.x=funcRect.origin.x;
 rect.origin.x=funcRect.origin.y;
 rect.size.width=40;
 rect.size.height=40;
 
 //Almacenamos los valores que son rect con sus dimensiones y con el color verde
 cuadradito=[[Figura alloc] initWithRect:rect withColor: [NSColor greenColor]];
 
 
 return cuadradito;
    
}


//AZUL
+(id)rectanguloAzul{
 
 NSRect rect;
 Figura *cuadradito;
 
 rect.origin.x=funcRect.origin.x;
 rect.origin.x=funcRect.origin.y;
 rect.size.width=40;
 rect.size.height=40;
 
 //Almacenamos los valores que son rect con sus dimensiones y con el color azul
 cuadradito=[[Figura alloc] initWithRect:rect withColor: [NSColor blueColor]];
 
 
 return cuadradito;
    
}

//AMARILLO
+(id)rectanguloAmarillo{
    
 NSRect rect;
 Figura *cuadradito;
 
 rect.origin.x=funcRect.origin.x;
 rect.origin.x=funcRect.origin.y;
 rect.size.width=40;
 rect.size.height=40;
 
 //Almacenamos los valores que son rect con sus dimensiones y con el color amarillo
 cuadradito=[[Figura alloc] initWithRect:rect withColor: [NSColor yellowColor]];
 
 
 return cuadradito;
}


//BLANCO
+(id)rectanguloBlanco{
    
    NSRect rect;
    Figura *cuadradito;
    
    rect.origin.x=funcRect.origin.x;
    rect.origin.x=funcRect.origin.y;
    rect.size.width=40;
    rect.size.height=40;
    
    //Almacenamos los valores que son rect con sus dimensiones y con el color rojo
    cuadradito=[[Figura alloc] initWithRect:rect withColor: [NSColor whiteColor]];
    
    
    return cuadradito;
}

-(void)muestraCuadrado: (NSRect)c  withGraphicsContext: (NSGraphicsContext *) cotxt{
   NSPoint aPoint,final;
    //float distance = funcRect.size.width;
    [rectPath removeAllPoints]; //ojo con esto, eficiencia y
    [cotxt saveGraphicsState];  // painter’s model
    NSAffineTransform *tf = [NSAffineTransform transform];
    [tf translateXBy:c.size.width yBy:c.size.height];
    [tf scaleXBy:c.size.width/funcRect.size.width
             yBy:c.size.height/funcRect.size.height];
    [tf concat];
    
    //Coloco el punto inicial a un valor -100 del origen en el eje de las x y coloco el punto final a una distancia de
    //+200 en el eje de las x desde el punto inicial, por ultimo uno los dos puntos formando una linea y a la linea
    //dibujada le doy un grosor de 200, logrando de esta forma un cuadrado
    [rectPath setLineWidth:GROSORL];
    [colorRelleno setStroke];
    aPoint.x = funcRect.origin.x-DESPX;
    aPoint.y = aPoint.x+DESPX;
    
    final.x=(aPoint.x+2*DESPX);
    final.y=(aPoint.y);
    [rectPath moveToPoint:aPoint];
    [rectPath lineToPoint:final];
    
    [rectPath stroke];
    [cotxt restoreGraphicsState];
}



@end
