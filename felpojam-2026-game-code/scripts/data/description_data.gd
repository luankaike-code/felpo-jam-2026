class_name DescriptionsData extends Resource

enum names {
	stamp,
	paper,
	stand_ink,
	dropper,
	rune_book,
	trash,
	teleporter,
	table_bell,
	super_stamp,
	draggable_disable
}

static var descriptions: Dictionary[names, String] = {
	names.stamp: "Um carimbo runico de %s",
	names.paper: "Coloque um carimbo runico com tinta aqui",
	names.stand_ink: "Mole o carimbo com tinta aqui",
	names.dropper: "Use isso numa runa para potencializará",
	names.rune_book: "Clique direito pra ler o livro runico",
	names.trash: "Joguei seus erros aqui",
	names.teleporter: "Use isso para enviar seus pergaminhos para a outra tela",
	names.table_bell: "Clique direito para chamar um novo cliente",
	names.super_stamp: "Um poderossimo carimbo runico %s",
	names.draggable_disable: "Está desabilitado por agora"
}
