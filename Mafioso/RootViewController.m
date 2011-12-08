//
//  RootViewController.m
//  Mafioso
//
//  Created by Pedro Góes on 12/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [bloqueio setAlpha:0.0];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)definirAlpha:(float)alpha {
    if (alpha == 0.0) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    
    titulo.alpha = 0.0;
    novoJogo.alpha = 0.0;
    instrucoes.alpha = 0.0;
    creditos.alpha = 0.0;
}


- (IBAction)tituloTocado:(id)sender {
    if ([titulo.currentTitle isEqualToString: TITULO_1]) {
        [titulo setTitle:TITULO_2 forState:UIControlStateNormal];
    } else {
        [titulo setTitle:TITULO_1 forState:UIControlStateNormal];
    }
}

- (IBAction)novoJogoTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        bloqueio.alpha = 1.0;
    }];

    [self performSelector:@selector(inserirSetupViewController) withObject:nil afterDelay:ANIMACAO_TRANSICAO];

}

- (IBAction)instrucoesTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        bloqueio.alpha = 1.0;
    } completion:^(BOOL fim) {
        InstrucoesViewController *ivc = [[InstrucoesViewController alloc] initWithNibName:@"InstrucoesViewController" bundle:nil];
        [self.navigationController pushViewController:ivc animated:NO];
        [ivc release];
    }];
}

- (IBAction)creditosTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        bloqueio.alpha = 1.0;
    } completion:^(BOOL fim) {
        CreditosViewController *cvc = [[CreditosViewController alloc] initWithNibName:@"CreditosViewController" bundle:nil];
        [self.navigationController pushViewController:cvc animated:NO];
        [cvc release];
    }];
}

- (void)inserirRootViewController {
    bloqueio.alpha = 1.0;
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        bloqueio.alpha = 0.0;
    }];
}

- (void)inserirSetupViewController {
    SetupViewController *svc = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    [self.navigationController pushViewController:svc animated:NO];
    [svc release];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

/*
#pragma mark - Navigation Controller Delegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (viewController == self) {
        [self inserirRootViewController];
    }
    
}
*/

@end
