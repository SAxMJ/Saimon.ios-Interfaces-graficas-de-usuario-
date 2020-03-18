//
//  Controller.m
//  PracticaCOCOA
//
//  Created by Alumno on 22/10/19.
//  Copyright © 2019 USAL. All rights reserved.
//

#import "Controller.h"
#import "Figura.h"
#import "DrawController.h"
#import "ETPanelController.h"
#define LIMITE 8


NSString *escribeEnTablaRojo=@"TablaRojo";
NSString *escribeEnTablaAmarillo=@"TablaAmarillo";
NSString *escribeEnTablaVerde=@"TablaVerde";
NSString *escribeEnTablaAzul=@"TablaAzul";
NSString *escribeEnTablaBlanco=@"TablaBlanco";
NSString *escribeEnTablaBlancoNoBorra=@"TablaBlancoNoBorra";
NSString *desactivaBotCol=@"DesBotCol";
NSString *activaBotCol=@"ABotCol";
NSString *desactivaSlider=@"DesSlider";
NSString *activaSlider=@"ASlider";
NSString *limpiaTablaDePulsado=@"LimpiaTablaP";
NSString *limpioTablaCuadrado=@"LimpiaTablaC";
NSString  *avisaNil=@"AvisaNil";

extern NSString *muestraRojo;
extern NSString *muestraVerde;
extern NSString *muestraAzul;
extern NSString *muestraAmarillo;
extern int gDificultad;

@implementation Controller


-(id)init
{
    self = [super init];
    if(self){
        cuadraditosColores = [[NSMutableArray alloc]init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(manejadoraRojo:)
                   name:muestraRojo
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(manejadoraVerde:)
                   name:muestraVerde
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(manejadoraAzul:)
                   name:muestraAzul
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(manejadoraAmarillo:)
                   name:muestraAmarillo
                 object:nil];
        
        
        flagPanel=0;
    }
    return self;
}


-(IBAction)panelControl:(id)sender{
    
    if (!panelController) {
        panelController = [[ETPanelController alloc]initWithWindowNibName:@"ETPanelController"];
        
    }
    if(flagPanel==0){
    [panelController showWindow:self];
    [empezar setEnabled:YES];
    flagPanel=1;
    }
    else{
    [panelController showWindow:self];
        
    }
    
}

-(BOOL)windowShouldClose:(id)sender {
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSInteger respuesta;
    
    [self reproduceSonido:6];
    
    respuesta = NSRunAlertPanel(@"Atención si cierras esta ventana se cerrará el juego por completo",
                                @"¿Está seguro de que quiere salir del juego?",
                                @"No",
                                @"Si" ,
                                nil);
    if (respuesta == NSAlertDefaultReturn){
        return 0;
    }
    else{
        [nc postNotificationName:avisaNil
                          object:self];
        
        cuadraditosColores=nil;
        [NSApp terminate:self];
        return YES;
    }
}



-(BOOL) salJuego:(id)sender{
    
    NSInteger respuesta;
    
    [self reproduceSonido:6];
    
    respuesta = NSRunAlertPanel(@"Atención",
                                @"¿Está seguro de que quiere salir del juego?",
                                @"No",
                                @"Si" ,
                                nil);
    if (respuesta == NSAlertDefaultReturn)
        return NO;
    else{
        cuadraditosColores=nil;
        [NSApp terminate:self];
        return YES;
    }
}

//Cuando ejecutemos el programa el label y el slider de dificultad dendran valores por defecto


-(void) modificarTurno:(int) turnoEntero{
    
    switch (turnoEntero) {
        case 0:
            [turno setStringValue:@"MEMORIZA LA SECUENCIA"];
            break;
        case 1:
            [turno setStringValue:@"ES TU TURNO"];
            break;
        case 2:
            [turno setStringValue:@"TURNO"];
            break;
        default:
            break;
    }
}


//MANEJADORAS QUE CUANDO SEAN AVISADAS POR PULSAR UN COLOR EN EL PANEL
//DIBUJARÁN UN CUADRADO E INCREMENTARÁN EL VALOR DE POSINTRODUCIDA

-(void)manejadoraRojo:(NSNotification *)notif{
    [self creaNuevaFiguraCuadradoRojo];
    vectorComprobacion[posIntroducida]='R';
    posIntroducida++;
    [self reproduceSonido:0];
}
-(void)manejadoraVerde:(NSNotification *)notif{
    
     [self creaNuevaFiguraCuadradoVerde];
    vectorComprobacion[posIntroducida]='V';
    posIntroducida++;
    [self reproduceSonido:3];
}
-(void)manejadoraAzul:(NSNotification *)notif{
    [self creaNuevaFiguraCuadradoAzul];
    
    vectorComprobacion[posIntroducida]='A';
    posIntroducida++;
    [self reproduceSonido:2];
}
-(void)manejadoraAmarillo:(NSNotification *)notif{
    
   
    [self creaNuevaFiguraCuadradoAmarillo];
    vectorComprobacion[posIntroducida]='Y';
    posIntroducida++;
    [self reproduceSonido:1];
}


//MÉTODO PARA REPRODUCIR LOS SONIDOS DEL JUEGO
-(void) reproduceSonido: (int) nSonido{
    
    NSString *sonidoSelected;
    
    switch (nSonido) {
        case 0:
            sonidoSelected = @"Rojo";
            break;
        case 1:
            sonidoSelected = @"Amarillo";
            break;
        case 2:
            sonidoSelected = @"Azul";
            break;
        case 3:
            sonidoSelected = @"Verde";
            break;
        case 4:
            sonidoSelected= @"Fallo";
            break;
        case 5:
            sonidoSelected= @"Victoria";
            break;
        case 6:
            sonidoSelected=@"alerta";
            break;
        default:
            break;
    }
    
    SystemSoundID soundID;
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:sonidoSelected ofType:@"caf"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
}



//MÉTODOS DE CREACION DE CUADRADROS DE COLORES

-(void)creaNuevaFiguraCuadradoBlanco:(int)flag{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    Figura *fig=[[Figura alloc]init];
    fig= [Figura rectanguloBlanco];
    if(flag!=0){
        [cuadraditosColores removeObjectAtIndex:0];
        [nc postNotificationName:escribeEnTablaBlanco
                          object:self];
    }else{
        [nc postNotificationName:escribeEnTablaBlancoNoBorra
                          object:self];
    }
    [cuadraditosColores addObject:fig];
    [vista setNeedsDisplay: YES];
}

-(void)creaNuevaFiguraCuadradoRojo{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    Figura *fig=[[Figura alloc]init];
    fig= [Figura rectanguloRojo];
    
    [cuadraditosColores removeObjectAtIndex:0];
    [cuadraditosColores addObject:fig];
    //Recargamos la clase vista
    [vista setNeedsDisplay: YES];
    
    [nc postNotificationName:escribeEnTablaRojo
                      object:self];
    
    [self reproduceSonido:0];
}

-(void)creaNuevaFiguraCuadradoVerde{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    Figura *fig=[[Figura alloc]init];
    fig= [Figura rectanguloVerde];
    
    [cuadraditosColores removeObjectAtIndex:0];
    [cuadraditosColores addObject:fig];
    //Recargamos la clase vista
    [vista setNeedsDisplay: YES];
    
    
    [nc postNotificationName:escribeEnTablaVerde
                      object:self];
    
    [self reproduceSonido:3];
}

-(void)creaNuevaFiguraCuadradoAmarillo{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    Figura *fig=[[Figura alloc]init];
    fig= [Figura rectanguloAmarillo];
    
    [cuadraditosColores removeObjectAtIndex:0];
    [cuadraditosColores addObject:fig];
    //Recargamos la clase vista
    [vista setNeedsDisplay: YES];
    
    [nc postNotificationName:escribeEnTablaAmarillo
                      object:self];
    
    [self reproduceSonido:1];
}

-(void)creaNuevaFiguraCuadradoAzul{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    Figura *fig=[[Figura alloc]init];
    fig= [Figura rectanguloAzul];
    
    [cuadraditosColores removeObjectAtIndex:0];
    [cuadraditosColores addObject:fig];
    //Recargamos la clase vista
    [vista setNeedsDisplay: YES];
    
    [nc postNotificationName:escribeEnTablaAzul
                      object:self];
    
    [self reproduceSonido:2];
}

//MÉTODO PARA MOSTRAR LOS CUADRADOS
-(void) muestraCuadrado: (NSRect)c
    withGraphicsContext: (NSGraphicsContext *)cotxt{
    //Lo envio a figura
    for(Figura *f in cuadraditosColores){
        [f muestraCuadrado: c
       withGraphicsContext: cotxt];
    }
}



//TEMPORIZADORES Y SELECTORES DE TEMPORIZADORES

-(void) iniciarContador{
    timer=[NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(comprobar) userInfo:nil repeats:YES];
}

//Selector que comprobará el estado del vector de comprobacion, desactivará los botones en cuanto se cumpla la condicion
-(void) comprobar{
    if(vectorComprobacion[pos]!=' '){
        [timer invalidate];
        timer=nil;
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc postNotificationName:desactivaBotCol
                          object:self];
        
        [self temporizadorEsperaAntesDeMostrarSecuencia];
    }
}

-(void) temporizadorMuestraColores{
    timerCol=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(muestraColoresSelector) userInfo:nil repeats:NO];
}

-(void) muestraColoresSelector{
    //Cuando hemos mostrado todos los colores que llevamos hasta el momento
    //iniciamos la comprobacion de cantidad de elementos en el vector y activamos los botones
    if(posMost>pos){
        
        [self modificarTurno:1];
        [timerCol invalidate];
        timer=nil;
        [self iniciarContador];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:activaBotCol
                          object:self];
        
    }
    
    //Insertamos el cuadrado y activamos el temporizador para que los botones "parpadeen"
    if(vAlmacena[posMost]=='R'){
        [self creaNuevaFiguraCuadradoRojo];
        [self temporizadorEncenderYApagarColores];
    }else if(vAlmacena[posMost]=='A'){
        
        [self creaNuevaFiguraCuadradoAzul];
        [self temporizadorEncenderYApagarColores];
    }else if(vAlmacena[posMost]=='Y'){
        
        [self creaNuevaFiguraCuadradoAmarillo];
        [self temporizadorEncenderYApagarColores];
    }else if(vAlmacena[posMost]=='V'){
        
        [self creaNuevaFiguraCuadradoVerde];
        [self temporizadorEncenderYApagarColores];
    } else{
        
        [self creaNuevaFiguraCuadradoBlanco:1];
    }
    
    posMost++;
}


//Esperamos 1.5 segundos despues de haber introducido los colores y antes de volver a mostrar la secuencia

-(IBAction)temporizadorEsperaAlIniciarPrograma:(id)sender{
    //Controlamos que es el primer cuadrado a dibujarse
    
    flag=0;
    [self creaNuevaFiguraCuadradoBlanco:flag];
    flag=1;
    tempEAIP=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(empezar) userInfo:nil repeats:NO];
}


-(void)temporizadorEsperaAntesDeMostrarSecuencia{
    
    tempEADMS=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(selectorEsperaPreSecuencia) userInfo:nil repeats:NO];
}

-(void)selectorEsperaPreSecuencia{
    
    
    [self creaNuevaFiguraCuadradoBlanco:1];
    
    
    [self compruebaColores];
}

-(void)temporizadorEncenderYApagarColores{
    
    tempEYAC=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(selectorOnColorOff) userInfo:nil repeats:NO];
}

-(void)selectorOnColorOff{
    
    
    [self creaNuevaFiguraCuadradoBlanco:1];
    
    [self temporizadorMuestraColores];
}





//METODO QUE INICIA LA SECUENCIA

-(void) empezar{
    char col;
    pos=0;
    [self modificarTurno:0];
    
    
    //Desactivamos el botón de empezar, y el slider y por seguridad los botones de los colores
    
    [empezar setEnabled:NO];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:desactivaSlider
                      object:self];
    
    [nc postNotificationName:desactivaBotCol
                      object:self];
    
    //Inicializamos el array de colores
    colores[0]='A';
    colores[1]='Y';
    colores[2]='V';
    colores[3]='R';
    
    
    //Inicializamos el vector de comprobacion y de almacen a 0;
    for(int j=0; j<gDificultad+1; j++){
        vectorComprobacion[j]=' ';
    }
    for(int j=0; j<gDificultad+1; j++){
        vAlmacena[j]=' ';
    }
    
    //Almacenamos un nuevo color y mostramos los colores
    col=colores[rand () % (3-0+1) + 0];
    posVAlmacena=0;
    vAlmacena[posVAlmacena]=col;
    
    
    //Cuando hemos almacenado el nuevo color mostramos los colores
    //Ponemos el posMost a 0 para poder mostrar los colores
    //Y posIntroducida para controlar la posicion donde estamos insertando con los botones
    posMost=0;
    posIntroducida=0;
    [self temporizadorMuestraColores];
}


//MÉTODO QUE COMPRUEBA LAS SECUENCIAS

//Comprobamos de nuevo todos los colores introducidos dentro del array de comprobacion
//y si todo esta correcto  insertamos un nuevo color
-(int) compruebaColores{
    
    NSInteger respuesta;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //COMPROBACIONES DE COLORES
    for(int i=0; i<=pos; i++){
        if(vectorComprobacion[i]!=vAlmacena[i]){
            
            //Si fallamos limpiamos antes la tableview
            for(i=0; i<=pos;i++){
                [nc postNotificationName:limpiaTablaDePulsado
                                  object:self];
            }
            
            //Eliminamos el valor que queda almacenado en la tabla
            [nc postNotificationName:limpioTablaCuadrado
                              object:self];
            
            [self modificarTurno:2];
            [self reproduceSonido:4];
            
            [cuadraditosColores removeObjectAtIndex:0];
            [vista setNeedsDisplay:YES];
            
            
            respuesta = NSRunAlertPanel(@"¡¡FALLASTE!!",
                                        @"Sigue intentándolo, ¿Volver a jugar?",
                                        @"Aceptar",
                                        @"Salir" ,
                                        nil);
            if (respuesta == NSAlertDefaultReturn){
                
                [empezar setEnabled:YES];
                [nc postNotificationName:activaSlider
                                  object:self];
                return NO;
            }
            else{
                [nc postNotificationName:avisaNil
                                  object:self];
                
                cuadraditosColores=nil;
                [NSApp terminate:self];
                return YES;
            }
            
            return 0;
        }
    }
    
    //Si alcanzamos la posición maxima mostramos mensaje de si queremos seguir jugando o no
    if(pos==gDificultad-1){
        
        //Limpiamos la tabla de comprobacion de pulsado
        for(int i=0; i<=pos;i++){
            [nc postNotificationName:limpiaTablaDePulsado
                              object:self];
        }
        
        //Eliminamos el valor que queda almacenado en la tabla
        [nc postNotificationName:limpioTablaCuadrado
                          object:self];
        
        
        [self modificarTurno:2];
        [self reproduceSonido:5];
        
        [cuadraditosColores removeObjectAtIndex:0];
        [vista setNeedsDisplay:YES];
        
        respuesta = NSRunAlertPanel(@"¡¡ENHORABUENA!!",
                                    @"Límite de colores alcanzado, ¿Volver a jugar?",
                                    @"Aceptar",
                                    @"Salir" ,
                                    nil);
        if (respuesta == NSAlertDefaultReturn){
            
            [empezar setEnabled:YES];
            [nc postNotificationName:activaSlider
                              object:self];
            return NO;
        }
        else{
            
            [nc postNotificationName:avisaNil
                              object:self];
            
            cuadraditosColores=nil;
            [NSApp terminate:self];
            return YES;
        }
        
        
        return 0;
    }
    
    //ANTES DE AÑADIR UN NUEVO COLOR Y MOSTRAR LA SECUENCIA VACIAMOS LA TABLA DE COMPROBACION DE PULSADO
    
    for(int i=0; i<=pos;i++){
        [nc postNotificationName:limpiaTablaDePulsado
                          object:self];
    }
    
    [self modificarTurno:0];
    [self masColores];
    return 1;
}




//MÉTODO QUE AÑADIRÁ NUEVOS COLORES
-(int) masColores{
    
    char col;
    
    pos++;
    col=colores[rand () % (3-0+1) + 0];
    posVAlmacena++;
    vAlmacena[posVAlmacena]=col;
    
    posMost=0;
    posIntroducida=0;
    [self temporizadorMuestraColores];
    return 1;
}

-(void) dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}
@end

