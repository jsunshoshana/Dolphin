"Filed out from Dolphin Smalltalk X6.2"!

Object subclass: #StyledShadow
	instanceVariableNames: 'color density offset'
	classVariableNames: ''
	poolDictionaries: 'GdiplusConstants'
	classInstanceVariableNames: ''!
StyledShadow guid: (GUID fromString: '{B7558F23-322B-4C65-AB23-0E43EAD228BF}')!
StyledShadow comment: ''!
!StyledShadow categoriesForClass!Unclassified! !
!StyledShadow methodsFor!

color
	^color!

color: aColor 
	color := aColor!

density
	^density!

density: aFloat 
	density := (aFloat min: 100) max: 0!

offset
	^offset!

offset: aPoint 
	offset := aPoint asPoint!

paintShadowOf: path on: graphics 
	"Paint the shadow of path on the receiver. Thanks to
	http://www.codeproject.com/KB/GDI-plus/FuzzyDropShadows.aspx for the method."

	| brush colorBlendColors colorBlendPositions region |
	brush := GdiplusPathGradientBrush path: path.
	brush wrapMode: WrapModeClamp.
	colorBlendColors := Array 
				with: Color none asARGB
				with: self shadowColor
				with: self shadowColor.
	colorBlendPositions := #(0.0 0.2 1.0).
	brush blendColors: colorBlendColors positions: colorBlendPositions.
	region := GdiplusRegion fromPath: path.
	graphics clipRegion: region combineMode: CombineModeExclude.
	graphics translateTransform: self offset.
	graphics fillPath: path brush: brush.
	graphics resetClip.
	graphics translateTransform: self offset negated.
	brush free.
	region free!

shadowColor
	^self color alpha: (self density * 255 min: 255)! !
!StyledShadow categoriesFor: #color!accessing!public! !
!StyledShadow categoriesFor: #color:!accessing!public! !
!StyledShadow categoriesFor: #density!accessing!public! !
!StyledShadow categoriesFor: #density:!accessing!public! !
!StyledShadow categoriesFor: #offset!accessing!public! !
!StyledShadow categoriesFor: #offset:!accessing!public! !
!StyledShadow categoriesFor: #paintShadowOf:on:!event handling!public! !
!StyledShadow categoriesFor: #shadowColor!event handling!public! !

!StyledShadow class methodsFor!

defaultShadowColor
	^Color darkShadow3d!

defaultShadowDensity
	^0.7!

defaultShadowOffset
	^15@15!

new
	^super new	
		color: self defaultShadowColor;
		offset: self defaultShadowOffset;
		density: self defaultShadowDensity! !
!StyledShadow class categoriesFor: #defaultShadowColor!public! !
!StyledShadow class categoriesFor: #defaultShadowDensity!public! !
!StyledShadow class categoriesFor: #defaultShadowOffset!public! !
!StyledShadow class categoriesFor: #new!instance creation!public! !

