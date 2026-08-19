# Master-Project – Vorgabenkonformes Template

## Compiler

In Overleaf **XeLaTeX** verwenden, da die Vorgabe Arial verlangt.

## Textgröße direkt im Dokument

Die Fließtextgröße muss nicht mehr in `template.cls` geändert werden.

```latex
\documentclass[11pt]{template}
```

Unterstützt werden die Standardgrößen der `report`-Klasse:

```latex
\documentclass[10pt]{template}
\documentclass[11pt]{template}
\documentclass[12pt]{template}
```

Ohne Größenangabe verwendet das Template weiterhin **11 pt**.

## Überschriften

Alle Gliederungsüberschriften verwenden **exakt dieselbe Schriftgröße wie der Fließtext**:

- `chapter`
- `section`
- `subsection`
- `subsubsection`

Bei:

```latex
\documentclass[11pt]{template}
```

sind damit alle genannten Überschriften **11 pt**. Sie unterscheiden sich nur durch
Fettung, Nummerierung und Abstände.

## Abstand Caption ↔ Abbildung/Tabelle

Standardmäßig sind nur **2 pt** Abstand zwischen Caption und dem eigentlichen
Bild bzw. der Tabelle eingestellt.

Dieser Wert kann direkt im Dokument geändert werden:

```latex
\setcaptiongap{1pt}
```

oder beispielsweise:

```latex
\setcaptiongap{4pt}
```

## Harvard-Zitation

Das Template verwendet `biblatex` mit `style=bath`, einem expliziten
Harvard-Referenzstil.

Beispiele:

```latex
\parencite{knuth1984}
```

ergibt sinngemäß:

```text
(Knuth, 1984)
```

Mit Seitenzahl:

```latex
\parencite[12]{knuth1984}
```

ergibt:

```text
(Knuth, 1984, S. 12)
```

Textuell:

```latex
\textcite{knuth1984}
```

ergibt:

```text
Knuth (1984)
```

Das Literaturverzeichnis wird weiterhin mit:

```latex
\printreferences
```

ausgegeben und alphabetisch im Harvard-Stil formatiert.

## Nummerierung

- Deckblatt: ohne sichtbare Seitennummer
- Inhaltsverzeichnis: römisch ab II
- weitere Verzeichnisse: römisch fortlaufend
- Hauptteil: arabisch ab 1
- Kapitel: `1`, `2`, ...
- Abschnitte: `1.1`, `1.2`, ...
- Unterabschnitte: `1.1.1`, ...
- Abbildungen: `Abb. 1`, `Abb. 2`, ...
- Tabellen: `Tab. 1`, `Tab. 2`, ...
- Anhänge: `A.1`, `A.2`, ...

## Minimaler Dokumentstart

```latex
\documentclass[11pt]{template}

\begin{document}

\maketitle
\makefrontmatter

\chapter{Projektbeschreibung}
\section{Projektumfeld}

% ...

\printreferences

\startappendices
\appendixentry{Quellcode XYZ}

\end{document}
```


## Quellcode in verschiedenen Programmiersprachen

Verwendung:

```latex
\begin{documentcode}{Sprache}{Beschreibung}{Quelle}
...
\end{documentcode}
```

Beispiel:

```latex
\begin{documentcode}{CSharp}{Initialisierung des App SDK}{Eigene Darstellung}
public void Initialize()
{
    ...
}
\end{documentcode}
```

Die Beschreibung wird **genau wie bei einer normalen Abbildung** ausgegeben:

```text
Abb. 3: Initialisierung des App SDK
[Code]
Quelle: Eigene Darstellung
```

Sie erscheint automatisch im Abbildungsverzeichnis. Der Abstand zwischen Code und
Quelle wurde auf ein Minimum reduziert.

Direkt nutzbar sind u. a. `CSharp`, `Java`, `C`, `C++`, `Python`,
`JavaScript`, `TypeScript`, `SQL`, `XML` und `JSON`.

## Zeilen- und Absatzabstand

Die Vorgabe verlangt **einzeiligen Zeilenabstand**. Das Template erzwingt deshalb:

```latex
\AtBeginDocument{\singlespacing}
```

Ein neuer Absatz entsteht einfach durch eine Leerzeile:

```latex
Erster Absatz.

Zweiter Absatz.
```

Es ist kein `\noindent` nötig. Das Template setzt global:

```latex
\setlength{\parindent}{0pt}
```

Zwischen zwei Absätzen liegen standardmäßig nur `3pt`. Dieser Abstand ist
unabhängig vom Zeilenabstand und kann im Dokument angepasst werden:

```latex
\setparagraphspacing{3pt}
```
