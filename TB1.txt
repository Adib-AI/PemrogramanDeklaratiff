:- use_module(library(jpl)).
start :-sleep(0.2),
		write('------------------------------------------'),nl,
		sleep(0.4),nl,
		write("      WELCOME TO MOBILE GANGGU
		"),nl,
		sleep(0.4),
		write('-----------------------------------------'),nl,nl,nl,


        /*write("Hello There, PLEASE INPUT YOUR FIRST NAME  ? "),
        read(Bocil),*/

		interface2.


/* hypothesis(Bocil,Disease),
        write(Patient),write(', you '), write(' probably have '),write(Disease),write('.'),undo,
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| BELAJAR YANG RAJIN CIL |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.*/

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['PENGECEKAN BOCIL'], F),
	jpl_new('javax.swing.JLabel',['MOBILE GANGGU'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

interface2 :-
	jpl_new('javax.swing.JFrame', ['PENGECEKAN BOCIL'], F),
	jpl_new('javax.swing.JLabel',['MOBILE GANGGU'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [300,75], _),
	jpl_call(F, setSize, [800,600], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'HELLO BOCIL, SIAPA NAMA MU ?'], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(null)
		->	write('BOCIL Have been cancelled'),interface3('OK ','KAMU ','TELAH MENCALLED ','SYSTEM'),end,fail
		;	write("Hi. How are you? First of all tell me your name please : "),write(N),nl,pt(N)
	).


interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['PENGECEKAN BOCIL'], F),
	jpl_new('javax.swing.JLabel',['MOBILE GANGGU'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).



















