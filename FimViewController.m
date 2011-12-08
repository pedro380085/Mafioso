//
//  FimViewController.m
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FimViewController.h"

@implementation FimViewController

@synthesize nomes;

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
    [imagem setFrame:CGRectMake(0.0, -8.0, 320.0, 420.0)];
    [self definirAlpha:0.0];
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*0.6 animations:^{
        [imagem setFrame:CGRectMake(0.0, -234.0, 320.0, 420.0)];
        [self definirAlpha:1.0];
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

- (void)definirAlpha:(float)alpha {
    if (alpha == 0.0) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    
    bomJogo.alpha = alpha;
    ordemJogadores.alpha = alpha;
    novoJogo.alpha = alpha;
    menuInicial.alpha = alpha;
}

- (IBAction)ordemJogadoresTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [tabela setFrame:CGRectMake(0.0, 186.0, tabela.frame.size.width, tabela.frame.size.height)];
        [retornarJogadores setFrame:CGRectMake(0.0, 423.0, retornarJogadores.frame.size.width, retornarJogadores.frame.size.height)];
    }];
    
    [tabela reloadData];
}

- (IBAction)retornarJogadoresTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [tabela setFrame:CGRectMake(0.0, 480.0, tabela.frame.size.width, tabela.frame.size.height)];
        [retornarJogadores setFrame:CGRectMake(0.0, 483.0, retornarJogadores.frame.size.width, retornarJogadores.frame.size.height)];
    }];
    
    [tabela reloadData];
}

- (IBAction)novoJogoTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*1.3 animations:^{
        [bloqueio setAlpha:1.0];
    } completion:^(BOOL fim) {
        RootViewController *controller = (RootViewController *)[self.navigationController.viewControllers objectAtIndex:0];
        [self.navigationController popToRootViewControllerAnimated:NO];
        [controller inserirSetupViewController];
    }]; 
}

- (IBAction)menuTocado:(id)sender {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*1.3 animations:^{
        [bloqueio setAlpha:1.0];
    } completion:^(BOOL fim) {
        RootViewController *controller = (RootViewController *)[self.navigationController.viewControllers objectAtIndex:0];
        [self.navigationController popToRootViewControllerAnimated:NO];
        [controller inserirRootViewController];
    }];    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [nomes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel. text = [NSString stringWithFormat:@"%d", indexPath.row+1];
    cell.detailTextLabel.text = [nomes objectAtIndex:indexPath.row];
    cell.detailTextLabel.textAlignment = UITextAlignmentLeft;
    
    return cell;
}



@end
