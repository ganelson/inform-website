.PHONY: books

books:
	pushd ../inform; indoc/Tangled/indoc -from resources/Documentation -to ../inform-website/docs/book -insertion ../inform-website/book_nav.html newwebsite; popd
