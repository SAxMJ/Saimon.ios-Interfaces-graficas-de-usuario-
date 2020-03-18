
//  ETPanelController.m
//  PracticaCOCOA
//
//  Created by Alumno on 8/11/19.
//  Copyright © 2019 USAL. All rights reserved.
//

#import "ETPanelController.h"
#import "Controller.h"

NSString *muestraRojo=@"Rojo";
NSString *muestraVerde=@"Verde";
NSString *muestraAzul=@"Azul";
NSString *muestraAmarillo=@"Amarillo";
int gDificultad;

extern NSString *escribeEnTablaRojo;
extern NSString *escribeEnTablaAmarillo;
extern NSString *escribeEnTablaVerde;
extern NSString *escribeEnTablaAzul;
extern NSString *escribeEnTablaBlanco;
extern NSString *desactivaBotCol;
extern NSString *activaBotCol;
extern NSString *desactivaSlider;
extern NSString *activaSlider;
extern NSString *activaEmpYDiff;
extern NSString *escribeEnTablaBlancoNoBorra;
extern NSString *limpiaTablaDePulsado;
extern NSString  *limpioTablaCuadrado;
extern NSString  *avisaNil;

@implementation ETPanelController


-(id)init
{
    self = [super init];
    if(self){

    }
    if(![super initWithWindowNibName:@"ETPanelController"])
        return nil;
    return self;
}


- (void)windowDidLoad {
    
    colorTabla = [[NSMutableArray alloc]init];
    cuadradoEnPantalla=[[NSMutableArray alloc]init];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
     
     [nc addObserver:self
     selector:@selector(manescribeEnTablaRojo:)
     name:escribeEnTablaRojo
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manescribeEnTablaAzul:)
     name:escribeEnTablaAzul
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manescribeEnTablaBlanco:)
     name:escribeEnTablaBlanco
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manescribeEnTablaBlancoNoBorra:)
     name:escribeEnTablaBlancoNoBorra
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manescribeEnTablaVerde:)
     name:escribeEnTablaVerde
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manescribeEnTablaAmarillo:)
     name:escribeEnTablaAmarillo
     object:nil];
     
     [nc addObserver:self
     selector:@selector(mandesactivaBotCol:)
     name:desactivaBotCol
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manactivaBotCol:)
     name:activaBotCol
     object:nil];
     
     [nc addObserver:self
     selector:@selector(mandesactivaSlider:)
     name:desactivaSlider
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manactivaSlider:)
     name:activaSlider
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manlimpiaTablaDePulsado:)
     name:limpiaTablaDePulsado
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manlimpioTablaCuadrado:)
     name:limpioTablaCuadrado
     object:nil];
     
     [nc addObserver:self
     selector:@selector(manavisaNil:)
     name:avisaNil
     object:nil];

    
    [super windowDidLoad];
    
}



-(void)awakeFromNib{
    [dificultad setIntValue:5];
    [textDificultad setIntValue:[dificultad intValue]];
    gDificultad=[dificultad intValue];
}

-(IBAction)modificaDificultad:(id)sender{
    
    [textDificultad setIntValue:[dificultad intValue]];
    gDificultad=[dificultad intValue];
}


-(IBAction) rojo: (id) sender{
  
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //Se avisa que se dibuje el cuadrado por pantalla
    [nc postNotificationName:muestraRojo
                      object:self];
    
    NSString *string= @"R";
    [colorTabla addObject: string];
    [tablaRegistro reloadData];
}

-(IBAction) amarillo: (id) sender{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc postNotificationName:muestraAmarillo
                      object:self];
    
    NSString *string= @"Y";
    [colorTabla addObject: string];
    [tablaRegistro reloadData];
}
-(IBAction) verde: (id) sender{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc postNotificationName:muestraVerde
                      object:self];
    
    NSString *string= @"V";
    [colorTabla addObject: string];
    [tablaRegistro reloadData];
}
-(IBAction) azul: (id) sender{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:muestraAzul
                      object:self];
    
    NSString *string= @"A";
    [colorTabla addObject: string];
    [tablaRegistro reloadData];
}


//EL CONTROLADOR LE AVISA QUE EJECUTE ESTE METODO

-(void)manescribeEnTablaRojo: (NSNotification *)notif{
    
    NSString *stringc= @"CUAD ROJO";
    
    [cuadradoEnPantalla removeObjectAtIndex: 0];
    [cuadradoEnPantalla addObject: stringc];
    [colorMostrado reloadData];
    
}


-(void)manescribeEnTablaAmarillo: (NSNotification *)notif{
    
    NSString *stringc= @"CUAD AMARILLO";
    
    [cuadradoEnPantalla removeObjectAtIndex: 0];
    [cuadradoEnPantalla addObject: stringc];
    [colorMostrado reloadData];
    
}
-(void)manescribeEnTablaVerde: (NSNotification *)notif{
    
    NSString *stringc= @"CUAD VERDE";
    
    [cuadradoEnPantalla removeObjectAtIndex: 0];
    [cuadradoEnPantalla addObject: stringc];
    [colorMostrado reloadData];
    
}
-(void)manescribeEnTablaAzul: (NSNotification *)notif{
    
    NSString *stringc= @"CUAD AZUL";
    
    [cuadradoEnPantalla removeObjectAtIndex: 0];
    [cuadradoEnPantalla addObject: stringc];
    [colorMostrado reloadData];
    
}
-(void)manescribeEnTablaBlanco: (NSNotification *)notif{
    
    [cuadradoEnPantalla removeObjectAtIndex: 0];
    
    NSString *stringc= @"CUAD BLANCO";
    [cuadradoEnPantalla addObject: stringc];
    [colorMostrado reloadData];
    
}
-(void)manescribeEnTablaBlancoNoBorra: (NSNotification *)notif{
    
    NSString *stringc= @"CUAD BLANCO";
    [cuadradoEnPantalla addObject: stringc];
    [colorMostrado reloadData];
    
}



-(void)manactivaBotCol: (NSNotification *)notif{
    
    [red setEnabled:YES];
    [yellow setEnabled:YES];
    [blue setEnabled:YES];
    [green setEnabled:YES];
}

-(void)mandesactivaBotCol: (NSNotification *)notif{
    [red setEnabled:NO];
    [yellow setEnabled:NO];
    [blue setEnabled:NO];
    [green setEnabled:NO];
}

//TIENE QUE AVISAR EL CONTROLADOR QUE DESACTIVE LOS BOTONES


-(void)manactivaSlider: (NSNotification *)notif{
    [dificultad setEnabled:YES];
}

-(void)mandesactivaSlider: (NSNotification *)notif{
    [dificultad setEnabled:NO];
}

-(void)manlimpiaTablaDePulsado: (NSNotification *)notif{
    
    [colorTabla removeObjectAtIndex: 0];
    [tablaRegistro reloadData];
}

-(void)manavisaNil: (NSNotification *)notif{
    
    colorTabla=nil;
    cuadradoEnPantalla=nil;
}

-(void)manlimpioTablaCuadrado: (NSNotification *)notif{
    
    [cuadradoEnPantalla removeObjectAtIndex: 0];
    [colorMostrado reloadData];
}


//REALIZAMOS UNA COMPROBACION QUE DETERMINE CUAL DE LAS DOS TABLAS NECESITA EN CADA MOMENTO LAS FUNCIONES
//MÉTODOS PARA EL FUNCIONAMIENTO DE LAS TABLEVIEWS
- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView{
    if(tableView==tablaRegistro){
        return [colorTabla count];
    }
    
   else{
       return [cuadradoEnPantalla count];
    }
    
}
-(id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row{
    if(tableView==tablaRegistro){
        NSString *cadena=[colorTabla objectAtIndex: row];
        return cadena;
    }
    else{
       NSString *cadena=[cuadradoEnPantalla objectAtIndex: row];
        return cadena;
    }
}




@end
