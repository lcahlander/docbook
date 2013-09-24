xquery version "3.0";

import module namespace db5-to-fo="http://docbook.org/apps/docbook/5/fo" at "modules/docbook5-to-fo.xqm";

let $article := <article xmlns="http://docbook.org/ns/docbook"
    xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0">
    <info>
        <title>Article Template Title</title>
        <author>
            <orgname>Organization Name</orgname>
            <address>
                <city>City</city>
                <street>Street</street>
                <postcode>000000</postcode>
                <country>Country</country>
            </address>
            <email>user@example.com</email>
        </author>
    </info>
    <sect1>
        <title>Section1 Title</title>
        <subtitle>Section1 Subtitle</subtitle>
        <para>Text</para>
    </sect1>
</article>

        let $fo := db5-to-fo:docbook2fo($article)
        let $pdf := xslfo:render($fo, "application/pdf", ())
        let $response := response:stream-binary($pdf, "media-type=application/pdf", "lctmp.pdf")
        return
            $response
