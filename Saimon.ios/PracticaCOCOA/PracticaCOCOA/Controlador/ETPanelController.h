//
//  ETPanelController.h
//  PracticaCOCOA
//
//  Created by Alumno on 8/11/19.
//  Copyright © 2019 USAL. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Controller.h"

@class Controller;


@interface ETPanelController : NSWindowController<NSWindowDelegate,
                                                    NSTextFieldDelegate,
                                                    NSTableViewDelegate,
                                                    NSTableViewDataSource,
                                                    NSControlTextEditingDelegate>{




IBOutlet NSButton *red,*yellow,*green,*blue;
IBOutlet NSSlider *dificultad;
IBOutlet NSTextField *textDificultad;
IBOutlet NSTableView *tablaRegistro;
IBOutlet NSTableView *colorMostrado;
    

NSMutableArray *colorTabla,*cuadradoEnPantalla;
        
     Controller *controller;
}


-(IBAction)modificaDificultad:(id)sender;
-(IBAction) rojo: (id) sender;
-(IBAction) amarillo: (id) sender;
-(IBAction) verde: (id) sender;
-(IBAction) azul: (id) sender;



//Notificaciones
-(void)manescribeEnTablaRojo: (NSNotification *)notif;
-(void)manescribeEnTablaAmarillo: (NSNotification *)notif;
-(void)manescribeEnTablaVerde: (NSNotification *)notif;
-(void)manescribeEnTablaAzul: (NSNotification *)notif;
-(void)manescribeEnTablaBlanco: (NSNotification *)notif;
-(void)escribeEnTablaBlancoNoBorra: (NSNotification *)notif;
-(void)mandesactivaBotCol: (NSNotification *)notif;
-(void)manactivaBotCol: (NSNotification *)notif;
-(void)mandesactivaSlider: (NSNotification *)notif;
-(void)manactivaSlider: (NSNotification *)notif;
-(void)manlimpiaTablaDePulsado: (NSNotification *)notif;
-(void)manlimpioTablaCuadrado: (NSNotification *)notif;
-(void)manavisaNil: (NSNotification *)notif;
@end
