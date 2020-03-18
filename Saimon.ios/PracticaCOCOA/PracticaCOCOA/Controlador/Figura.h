//
//  Figura.h
//  PracticaCOCOA
//
//  Created by alumno5 on 24/10/2019.
//  Copyright © 2019 USAL. All rights reserved.
//


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Figura : NSObject{
    
    
    NSRect cuadraditoColor;
    NSColor *colorRelleno;
    NSBezierPath *rectPath;
    
}

//Declaramos los correspondientes guetter y setters
@property (nonatomic, copy) NSColor *colorRelleno;
@property (nonatomic) NSRect cuadraditoColor;

-(void)muestraCuadrado: (NSRect)c  withGraphicsContext:(NSGraphicsContext *) cotxt;
+(id)rectanguloRojo;
+(id)rectanguloVerde;
+(id)rectanguloAmarillo;
+(id)rectanguloAzul;
+(id)rectanguloBlanco;


@end

NS_ASSUME_NONNULL_END
