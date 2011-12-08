//
//  RootViewController.h
//  Mafioso
//
//  Created by Pedro Góes on 12/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constantes.h"
#import "SetupViewController.h"
#import "InstrucoesViewController.h"
#import "CreditosViewController.h"

@interface RootViewController : UIViewController <UINavigationControllerDelegate> {
    IBOutlet UIView *bloqueio;
    IBOutlet UIButton *titulo;
    IBOutlet UIButton *novoJogo;
    IBOutlet UIButton *instrucoes;
    IBOutlet UIButton *creditos;
}

- (IBAction)tituloTocado:(id)sender;
- (IBAction)novoJogoTocado:(id)sender;
- (IBAction)instrucoesTocado:(id)sender;
- (IBAction)creditosTocado:(id)sender;
- (void)inserirRootViewController;
- (void)inserirSetupViewController;

@end
