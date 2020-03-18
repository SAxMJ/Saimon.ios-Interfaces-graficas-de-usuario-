//
//  Controller.h
//  PracticaCOCOA
//
//  Created by Alumno on 22/10/19.
//  Copyright © 2019 USAL. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AudioToolbox/AudioToolbox.h>

@class DrawController;
@class Figura;
@class ETPanelController;

@interface Controller : NSObject<   NSWindowDelegate,
                                    NSTextFieldDelegate,
                                    NSAlertDelegate>{
    
    //Botones
    IBOutlet NSButton *exit;
    IBOutlet NSButton *empezar;
	IBOutlet NSButton *abrePanel;
    
    
    //Dificultad
    int diffIntcultad;
    
   
    //MutableArrays
    NSMutableArray *cuadraditosColores;
    
                                        
    //Vectores y posiciones para el funcionamiento
    char colores[4];
    char vectorComprobacion[20];
    char vAlmacena[20];
    int pos,posVAlmacena,posMost,posIntroducida,flag;
    int flagPanel;
                                        
    
    //Conexion con las otras clases
    IBOutlet DrawController *vista;
    IBOutlet Figura *modelo;
    ETPanelController *panelController;
                                        
    NSTimer *timer,*timerCol,*tempEAIP,*tempEADMS,*tempEYAC;
    int contSeg;
                                        
    //Turno
    IBOutlet NSTextField *turno;
    
}

-(BOOL) salJuego: (id) sender;
- (BOOL)windowShouldClose:(id) sender;


//Funciones creación de cuadrados
-(void) creaNuevaFiguraCuadradoRojo;
-(void) creaNuevaFiguraCuadradoVerde;
-(void) creaNuevaFiguraCuadradoAmarillo;
-(void) creaNuevaFiguraCuadradoAzul;
-(void) creaNuevaFiguraCuadradoBlanco;


-(IBAction)panelControl:(id)sender;
-(IBAction)temporizadorEsperaAlIniciarPrograma:(id)sender;
-(void) empezar;
-(void) comprobar;
-(int) compruebaColores;
-(void) iniciarContador;
-(int) masColores;
-(void) temporizadorMuestraColores;
-(void) muestraColoresSelector;
-(void)temporizadorEsperaAntesDeMostrarSecuencia;
-(void)selectorEsperaPreSecuencia;



-(void) muestraCuadrado: (NSRect)c
    withGraphicsContext: (NSGraphicsContext *)cotxt;
	

-(void)manejadoraRojo:(NSNotification *)notif;
-(void)manejadoraVerde:(NSNotification *)notif;
-(void)manejadoraAzul:(NSNotification *)notif;
-(void)manejadoraAmarillo:(NSNotification *)notif;
@end
