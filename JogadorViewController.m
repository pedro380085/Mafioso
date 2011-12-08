//
//  JogadorViewController.m
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JogadorViewController.h"

@implementation JogadorViewController

@synthesize ordem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    nomes = [[NSMutableArray array] retain];
    [bloqueio setAlpha:1.0];
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*1.3 animations:^{
        [imagem setFrame:CGRectMake(0.0, -8.0, 320.0, 420.0)];
    } completion:^(BOOL fim) {
        [bloqueio setAlpha:0.0];
    }];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)alternarView:(id)sender {
    
    if ([alternador.currentTitle isEqualToString: TITULO_3]) {
        int aletorio = arc4random() % [ordem count];
        NSString *personagemTexto = [[NSString alloc] initWithFormat:@"%@", [ordem objectAtIndex:aletorio]];
        [alternador setTitle:TITULO_4 forState:UIControlStateNormal];
        [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
            [imagem setFrame:CGRectMake(0.0, -46.0, 320.0, 420.0)];
        } completion:^(BOOL fim) {
            personagem.text = personagemTexto;
            [personagemTexto release];
        }];
        [nomes addObject:personagemTexto];
        [ordem removeObjectAtIndex:aletorio];
    } else {
        personagem.text = @"";
        [alternador setTitle:TITULO_3 forState:UIControlStateNormal];
        [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
            [imagem setFrame:CGRectMake(0.0, -8.0, 320.0, 420.0)];
        } completion:^(BOOL fim) {
            if ([ordem count] == 0) {
                
                [UIView animateWithDuration:ANIMACAO_TRANSICAO*0.6 animations:^{
                    bloqueio.alpha = 1.0;
                } completion:^(BOOL fim) {
                    FimViewController *fvc = [[FimViewController alloc] initWithNibName:@"FimViewController" bundle:nil];
                    fvc.nomes = nomes;
                    [self.navigationController pushViewController:fvc animated:NO];
                    [fvc release];
                }];
                
            }
        }];
    }
}


@end
