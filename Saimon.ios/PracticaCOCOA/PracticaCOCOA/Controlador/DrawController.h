//
//  DrawController.h
//  PracticaCOCOA
//
//  Created by Alumno on 22/10/19.
//  Copyright © 2019 USAL. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Controller;

@interface DrawController : NSView{
    
    IBOutlet __weak Controller *controlador;
    
}

@property (nonatomic,copy) NSColor * fondo;

- (void)drawRect:(NSRect)dirtyRect;

@end
