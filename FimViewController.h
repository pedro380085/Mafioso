//
//  FimViewController.h
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constantes.h"
#import "RootViewController.h"

@interface FimViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UIView *bloqueio;
    IBOutlet UIImageView *imagem;
    IBOutlet UILabel *bomJogo;
    IBOutlet UIButton *ordemJogadores;
    IBOutlet UIButton *retornarJogadores;
    IBOutlet UIButton *novoJogo;
    IBOutlet UIButton *menuInicial;
    IBOutlet UITableView *tabela;
    
    NSMutableArray *nomes;
}

@property (nonatomic, retain) NSMutableArray *nomes;

- (void)definirAlpha:(float)alpha;
- (IBAction)ordemJogadoresTocado:(id)sender;
- (IBAction)retornarJogadoresTocado:(id)sender;
- (IBAction)novoJogoTocado:(id)sender;
- (IBAction)menuTocado:(id)sender;

@end
