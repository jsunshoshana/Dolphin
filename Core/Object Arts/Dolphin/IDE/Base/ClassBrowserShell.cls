"Filed out from Dolphin Smalltalk 7"!

ClassBrowserAbstract subclass: #ClassBrowserShell
	instanceVariableNames: ''
	classVariableNames: 'LocalHierarchyMask'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ClassBrowserShell guid: (GUID fromString: '{5655079D-FA03-4CA0-85C5-73CD64654603}')!
ClassBrowserShell comment: 'ClassBrowserShell is a <SmalltalkToolShell> implementing the Class Hierarchy Browser development tool.

Instance Variables:
	None.

Class Variables:
	LocalHierarchyMask		<integer> mask flag for the local hierarchy mode.
'!
!ClassBrowserShell categoriesForClass!Development! !
!ClassBrowserShell methodsFor!

createComponents
	"Create the presenters contained by the receiver"

	super createComponents.
	classesPresenter := self 
				add: ClassHierarchySelector new
				name: 'classes'
				helpId: 10500!

defaultHelpId
	^10734!

displayLocalHierarchyOf: class
	"Private - Update the receiver to display only the local hierarchy of the <ClassDescription>,
	class."

	| instClass |
	instClass := class instanceClass.
	classesPresenter
		model: (ClassHierarchyModel withAllClasses	
				filter: [:x | (instClass allSuperclasses includes: x) or: [instClass withAllSubclasses includes: x]]).
!

isLocalHierarchyMode
	"Private - Answer whether the receiver is in 'local hierarchy' mode displaying a subset of the entire
	class hierarchy."

	^flags allMask: LocalHierarchyMask!

isLocalHierarchyMode: aBoolean 
	flags := flags mask: LocalHierarchyMask set: aBoolean!

onTipTextRequired: tool
	"Private - Tool tip text is required for the <ToolbarItem>, tool."

	| cmd |
	cmd := tool command asSymbol.
	cmd == #toggleLocalHierarchy ifTrue: [
		^(self isLocalHierarchyMode 
				ifTrue: ['Browse entire hierarchy']
				ifFalse: ['Browse local hierarchy of ', self selectedClass name])].
	^super onTipTextRequired: tool!

queryCommand: aCommandQuery 
	"Private - Enter details about a potential command for the receiver 
	into the <CommandQuery>."

	| cmd |
	cmd := aCommandQuery commandSymbol.
	#toggleLocalHierarchy == cmd 
		ifTrue: 
			[self isLocalHierarchyMode 
				ifTrue: 
					[aCommandQuery
						isEnabled: true;
						isChecked: true]
				ifFalse: 
					[aCommandQuery
						isEnabled: (self hasClassSelected and: [self actualClass superclass notNil]);
						isChecked: false].
			^true].
	^super queryCommand: aCommandQuery!

resetFor: aClass 
	"Reset the receiver to place it into a state required to display aClass"

	(self isLocalHierarchyMode 
		and: [(classesPresenter model filter value: aClass instanceClass) not]) 
			ifTrue: [self displayLocalHierarchyOf: aClass]!

toggleLocalHierarchy
	"Toggle between the entire hierarchy and showing only the current class and its subclasses."

	| instClass actualClass |
	self promptToSaveChanges ifFalse: [^self].

	"Use the selected class rather than the actual class, so always follows instance hierarchy"
	instClass := self selectedClass.
	actualClass := self actualClass.
	self isLocalHierarchyMode: self isLocalHierarchyMode not.
	self isLocalHierarchyMode 
		ifTrue: 
			["Toggled into local hierarchy mode"
			self displayLocalHierarchyOf: instClass.
			self actualClass: actualClass]
		ifFalse: 
			["Toggled out of local hierarchy mode..."
			classesPresenter model: self model classHierarchy.
			actualClass notNil ifTrue: [self actualClass: actualClass]].
	self validateUserInterface! !
!ClassBrowserShell categoriesFor: #createComponents!initializing!public! !
!ClassBrowserShell categoriesFor: #defaultHelpId!public! !
!ClassBrowserShell categoriesFor: #displayLocalHierarchyOf:!private!updating! !
!ClassBrowserShell categoriesFor: #isLocalHierarchyMode!private!testing! !
!ClassBrowserShell categoriesFor: #isLocalHierarchyMode:!accessing!private! !
!ClassBrowserShell categoriesFor: #onTipTextRequired:!event handling!private! !
!ClassBrowserShell categoriesFor: #queryCommand:!commands!private! !
!ClassBrowserShell categoriesFor: #resetFor:!commands!public! !
!ClassBrowserShell categoriesFor: #toggleLocalHierarchy!commands!public! !

!ClassBrowserShell class methodsFor!

displayOn: aStream
	"Append, to aStream, a String whose characters are a representation of the receiver as a user
	would want to see it."

	aStream nextPutAll: 'Class Browser'!

icon
	"Answers an Icon that can be used to represent this class"

	^##(self) defaultIcon!

initialize
	"Private - Initialize the receiver's class variables.
		self initialize
	"

	LocalHierarchyMask := 16r10.
	self defaultShowInheritedMethods: false.
	self defaultFilterObjectMethods: true.
	self canUseIdeaSpace: true.
	(Smalltalk developmentSystem)
		addSystemFolderIcon: self toolsFolderIcon;
		registerTool: self!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 3 788558 10 ##(Smalltalk.STBViewProxy) 8 ##(Smalltalk.ShellView) 98 27 0 0 98 2 27131905 131073 416 0 196934 1 ##(Smalltalk.RGB) 8 4294967295 0 567 0 0 0 416 788230 ##(Smalltalk.BorderLayout) 1 1 410 8 ##(Smalltalk.Toolbar) 98 25 0 416 98 2 8 1140851524 131073 560 0 524550 ##(Smalltalk.ColorRef) 8 4278190080 0 519 0 263174 ##(Smalltalk.Font) 0 16 459014 ##(Smalltalk.LOGFONT) 8 #[243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 3 2 1 34 65 114 105 97 108 0 159 4 28 198 63 1 0 0 204 53 63 1 3 0 20 59 0 0 0 0 247 0 5 86 111 1] 328198 ##(Smalltalk.Point) 193 193 0 560 642 672 8 4294903529 234 256 98 6 410 8 ##(Smalltalk.ReferenceView) 98 14 0 560 98 2 8 1140850688 131073 864 0 0 0 7 0 0 0 864 1180166 ##(Smalltalk.ResourceIdentifier) 576 8 #resource_Image_tools 0 983302 ##(Smalltalk.MessageSequence) 202 208 98 1 721670 ##(Smalltalk.MessageSend) 8 #createAt:extent: 98 2 770 1 1 770 63 51 864 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 31 0 0 0 25 0 0 0] 98 0 770 193 193 0 27 8 'imageTools' 410 880 98 14 0 560 98 2 8 1140850688 131073 1248 0 0 0 7 0 0 0 1248 946 576 8 #resource_Class_browser_tools 0 994 202 208 98 1 1058 1088 98 2 770 1 51 770 307 51 1248 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 153 0 0 0 50 0 0 0] 1200 1216 0 27 8 'classBrowserTools' 410 880 98 14 0 560 98 2 8 1140850688 131073 1504 0 0 0 7 0 0 0 1504 946 576 8 #resource_Smalltalk_tools 0 994 202 208 98 1 1058 1088 98 2 770 63 1 770 991 51 1504 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 31 0 0 0 0 0 0 0 14 2 0 0 25 0 0 0] 1200 1216 0 27 8 'smalltalkTools' 234 256 1200 202 208 1200 234 240 1200 0 1 0 770 33 33 770 45 45 0 656198 1 ##(Smalltalk.FlowLayout) 1 1 1 994 202 208 98 2 1058 1088 98 2 770 1 1 770 1329 101 560 1058 8 #updateSizePosted 1200 560 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 152 2 0 0 50 0 0 0] 98 3 864 1504 1248 1216 0 27 410 8 ##(Smalltalk.StatusBar) 98 18 0 416 98 2 8 1140852996 1 2064 0 642 672 0 7 0 690 0 16 722 8 #[245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 3 2 1 34 77 105 99 114 111 115 111 102 116 32 83 97 110 115 32 83 101 114 105 102 0 59 0 0 0 0 247 0 5 86 111 1] 770 193 193 0 2064 0 8 4294905391 234 256 98 8 853766 ##(Smalltalk.StatusBarItem) 1 841 2064 0 8 ##(Smalltalk.BasicListAbstract) 8 ##(Smalltalk.IconicListAbstract) 1049926 1 ##(Smalltalk.IconImageManager) 8 'message' 2274 1 401 2064 0 2304 2320 2352 8 'packageOfSelection' 2274 1 -1 2064 0 459270 ##(Smalltalk.Message) 8 #displayString 98 0 787814 3 ##(Smalltalk.BlockClosure) 0 0 918822 ##(Smalltalk.CompiledMethod) 2 3 2272 8 #defaultGetImageBlock 609947523 8 #[30 105 226 0 106] 8 #iconImageIndex 2512 7 257 0 0 8 'version' 2274 1 45 2064 0 0 2498 0 0 1180966 ##(Smalltalk.CompiledExpression) 5 1 8 ##(Smalltalk.UndefinedObject) 8 'doIt' 8 '[:modified | modified ifTrue: [Smalltalk developmentSystem changedIcon imageIndex]]' 8 #[33 105 17 122 45 159 160 161 106 60 106] 721414 ##(Smalltalk.Association) 8 #Smalltalk 48 8 #developmentSystem 8 #changedIcon 8 #imageIndex 2640 7 257 0 0 8 'modified' 98 4 2384 2624 2288 2416 1115142 ##(Smalltalk.StatusBarNullItem) 513 1 2064 0 0 994 202 208 98 1 1058 1088 98 2 770 1 833 770 1329 41 2064 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 160 1 0 0 152 2 0 0 180 1 0 0] 98 0 1216 0 27 0 0 410 8 ##(Smalltalk.ContainerView) 98 15 0 416 98 2 8 1140850688 131073 3072 0 0 0 7 0 0 0 3072 1180166 ##(Smalltalk.ProportionalLayout) 202 8 ##(Smalltalk.Dictionary) 98 1 2754 410 8 ##(Smalltalk.Splitter) 98 12 0 3072 98 2 8 1140850688 1 3248 0 642 672 0 519 0 0 0 3248 994 202 208 98 1 1058 1088 98 2 770 1 361 770 1329 11 3248 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 180 0 0 0 152 2 0 0 185 0 0 0] 98 0 1216 0 27 1 16 234 256 1200 0 994 202 208 98 1 1058 1088 98 2 770 1 101 770 1329 733 3072 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 50 0 0 0 152 2 0 0 160 1 0 0] 98 3 410 3088 98 15 0 3072 98 2 8 1140850688 131073 3680 0 0 0 7 0 0 0 3680 3154 202 3200 98 2 2754 410 3264 98 12 0 3680 98 2 8 1140850688 1 3808 0 642 672 0 519 0 0 0 3808 994 202 208 98 1 1058 1088 98 2 770 437 1 770 11 361 3808 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 218 0 0 0 0 0 0 0 223 0 0 0 180 0 0 0] 98 0 1216 0 27 1 2754 410 3264 98 12 0 3680 98 2 8 1140850688 1 4064 0 642 672 0 519 0 0 0 4064 994 202 208 98 1 1058 1088 98 2 770 883 1 770 11 361 4064 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 185 1 0 0 0 0 0 0 190 1 0 0 180 0 0 0] 98 0 1216 0 27 1 32 234 256 98 4 410 8 ##(Smalltalk.SlideyInneyOuteyThing) 98 23 0 3680 98 2 8 1140850688 131073 4336 0 642 8 4278190080 0 519 0 0 0 4336 655878 ##(Smalltalk.CardLayout) 202 208 98 3 2754 590662 1 ##(Smalltalk.CardLabel) 8 'Categories' 0 21481 410 8 ##(Smalltalk.TreeView) 98 27 0 410 8 ##(Smalltalk.SlidingCardTray) 98 22 0 4336 98 2 8 1140850688 131073 4624 0 917766 ##(Smalltalk.PluggableColor) 1058 8 #toolBackgroundColor 98 0 8 ##(Smalltalk.SmalltalkSystem) 0 7 0 0 0 4624 4464 234 256 98 6 410 8 ##(Smalltalk.ListView) 98 30 0 4624 98 2 8 1140936777 1 4832 590662 2 ##(Smalltalk.ListModel) 202 208 1200 0 1310726 ##(Smalltalk.IdentitySearchPolicy) 642 8 4278190080 0 29 265030 4 ##(Smalltalk.Menu) 0 16 98 7 984134 2 ##(Smalltalk.CommandMenuItem) 1 1180998 4 ##(Smalltalk.CommandDescription) 8 #browseSelectorsInProtocol 8 '&Selectors' 1 1 0 0 0 5074 1 5106 8 #toggleProtocolReadOnly 8 '&Read Only' 1 1 0 0 0 983366 1 ##(Smalltalk.DividerMenuItem) 4097 5074 1 5106 8 #addMethodProtocol 8 '&Add...' 1 1 0 0 0 5026 0 16 98 2 5074 1 5106 8 #removeMethodProtocol 8 'Protocol' 1 1 0 0 0 5074 1 5106 8 #removeMethodsInProtocol 8 'Methods' 1 1 0 0 0 8 'Remove' 0 1 0 0 0 0 0 5074 1 5106 8 #renameMethodProtocol 8 'Rename...' 1 1 0 0 0 5074 1 5106 8 #browseMethodProtocol 8 'Browse' 1 1 0 0 0 8 'Protocols' 0 134217729 0 0 0 0 0 0 0 4832 0 8 4294909021 2434 8 #name 98 0 2320 2352 0 0 2498 0 0 2658 5 1 2688 8 'doIt' 8 '[:ctx | ctx view presenter parentPresenter customDrawProtocols: ctx]' 8 #[33 105 226 0 159 160 17 179 106] 8 #view 8 #presenter 8 #parentPresenter 8 #customDrawProtocols: 5712 7 257 0 770 65 65 0 0 202 208 98 1 920646 5 ##(Smalltalk.ListViewColumn) 8 'Protocols' 325 8 #left 2434 5680 98 0 8 ##(Smalltalk.SortedCollection) 0 0 4832 0 3 0 2498 0 0 2658 5 1 2688 8 'doIt' 8 '[:ctx | ctx view presenter parentPresenter customDrawProtocols: ctx]' 8 #[33 105 226 0 159 160 17 179 106] 5792 5808 5824 5840 6016 7 257 0 8 #report 1200 0 133217 0 98 1 0 994 202 208 98 3 1058 1088 98 2 770 1 37 770 333 309 4832 1058 8 #contextMenu: 98 1 5040 4832 1058 8 #text: 98 1 8 'Protocols' 4832 1154 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 18 0 0 0 166 0 0 0 172 0 0 0] 98 0 1216 0 27 8 'protocols' 4576 8 'categories' 410 4848 98 30 0 4624 98 2 8 1140920395 1 6432 4914 202 208 1200 0 4976 642 8 4278190080 0 13 5026 0 16 98 10 5074 2097153 5106 8 #browseInstVarReferences 8 'Browse &References' 1 1 0 0 0 5234 4097 5074 1 5106 8 #addInstanceVariable 8 '&Add...' 1 1 0 0 0 5074 1 5106 8 #removeInstanceVariables 8 'Remo&ve' 1 1 0 0 0 5074 1 5106 8 #renameInstanceVariable 8 'Re&name' 1 1 0 0 0 5234 4097 5074 1 5106 8 #pushDownInstanceVariables 8 'Push &Down' 1 1 0 0 0 5074 1 5106 8 #createAccessors 8 '&Create Accessors' 1 1 0 0 0 5074 1 5106 8 #abstractInstanceVariables 8 'Ab&stract' 1 1 0 0 0 5074 1 5106 8 #protectInstanceVariables 8 '&Protect/Concrete' 1 1 0 0 0 0 0 134217729 0 0 0 0 0 0 0 6432 0 8 4294909021 2434 8 #value 98 0 2498 0 0 2658 4 1 2688 8 'doIt' 8 '[:a | a key icon imageIndex]' 8 #[32 105 17 158 159 160 106] 8 #key 8 #icon 2832 7200 7 257 0 2352 0 2498 0 0 2658 5 1 2688 8 'doIt' 8 '[:a | a key name, ''.'', a value]' 8 #[33 105 17 158 159 31 179 17 142 179 106] 7280 5680 8 '.' 8 #, 7312 7 257 0 0 770 65 65 0 0 202 208 98 1 5906 8 '' 201 5952 2304 6000 0 0 6432 0 1 0 0 8 #list 1200 0 133217 0 98 1 0 994 202 208 98 2 1058 1088 98 2 770 1 37 770 333 309 6432 1058 6256 98 1 6560 6432 1154 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 18 0 0 0 166 0 0 0 172 0 0 0] 98 0 1216 0 27 8 'variables' 0 410 8 ##(Smalltalk.TabViewXP) 98 28 0 4336 98 2 8 1140916864 1 7744 4914 202 208 98 3 4544 4530 8 'Protocols' 2498 0 0 2658 6 1 80 8 'doIt' 8 'CardLabel text: ''Protocols'' iconBlock: [MethodProtocol icon]' 8 #[45 30 34 112 47 161 106 194 105] 983558 ##(Smalltalk.VariableBinding) 8 #CardLabel 4528 7888 7986 8 #MethodProtocol 8 ##(Smalltalk.MethodProtocol) 7296 8 #text:iconBlock: 7904 11 1 0 21487 4530 8 'Variables' 0 21491 0 4976 4720 0 1 0 0 0 7744 0 8 4294903943 2304 2320 2352 0 0 0 0 0 8 #smallIcons 0 0 0 0 0 994 202 208 98 3 1058 1088 98 2 770 1 1 770 437 361 7744 1058 8 #basicSelectionsByIndex: 98 1 98 1 3 7744 1058 8 #tcmSetExtendedStyle:dwExStyle: 98 2 -1 1 7744 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 218 0 0 0 180 0 0 0] 98 0 1216 0 27 0 4336 770 33 33 1049862 ##(Smalltalk.ButtonInteractor) 4624 0 590342 ##(Smalltalk.Rectangle) 770 297 3 770 329 35 1 5106 8 #togglePin 8 'Pin or Unpin the tray' 1 1 0 0 0 994 202 208 98 1 1058 1088 98 2 770 97 9 770 333 345 4624 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 48 0 0 0 4 0 0 0 214 0 0 0 176 0 0 0] 98 3 4576 4832 6432 1216 0 27 98 2 8 1140916771 1 4576 590918 3 ##(Smalltalk.TreeModel) 0 4976 525062 ##(Smalltalk.TreeNode) 0 0 0 234 256 1200 642 8 4278190080 0 31 5026 0 16 98 4 5074 1 5106 8 #addMethodCategory 8 '&Add...' 1 1 0 0 0 5026 0 16 98 2 5074 1 5106 8 #removeMethodCategory 8 'Category' 1 1 0 0 0 5074 1 5106 8 #removeMethodsInCategory 8 'Methods' 1 1 0 0 0 8 'Remove' 0 1 0 0 0 0 0 5074 1 5106 8 #renameMethodCategory 8 'Rename...' 1 1 0 0 0 5074 1 5106 8 #browseMethodCategory 8 'Browse' 1 1 0 0 0 8 'Categories' 0 134217729 0 0 0 0 0 0 0 4576 0 8 4294904491 2434 8 #localName 98 0 2320 2352 0 0 2498 0 0 2658 5 1 2688 8 'doIt' 8 '[:ctx | ctx view presenter parentPresenter customDrawCategoryTree: ctx]' 8 #[33 105 226 0 159 160 17 179 106] 5792 5808 5824 8 #customDrawCategoryTree: 9376 7 257 0 0 0 234 240 1200 17 8 #noIcons 1 0 994 202 208 98 2 1058 1088 98 2 770 1 37 770 333 309 4576 1058 6256 98 1 8896 4576 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 18 0 0 0 166 0 0 0 172 0 0 0] 98 0 1216 0 27 2754 7872 4832 2754 8096 6432 4576 234 256 98 2 4624 8 'filters' 0 7744 4624 770 201 201 401 1 524319 0 0 994 202 208 98 1 1058 1088 98 2 770 447 1 770 437 361 4336 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 223 0 0 0 0 0 0 0 185 1 0 0 180 0 0 0] 98 2 4624 7744 1216 0 27 8 'filtersSlidey' 410 880 98 14 0 3680 98 2 8 1140850688 131073 9968 0 0 0 31 0 0 0 9968 946 8 ##(Smalltalk.ClassHierarchySelector) 8 #resource_Default_view 0 994 202 208 98 1 1058 1088 98 2 770 1 1 770 437 361 9968 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 218 0 0 0 180 0 0 0] 1200 1216 0 27 8 'classes' 0 994 202 208 98 1 1058 1088 98 2 770 1 1 770 1329 361 3680 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 152 2 0 0 180 0 0 0] 98 5 9968 3808 4336 4064 410 3088 98 15 0 3680 98 2 8 1140850688 131073 10400 0 0 0 7 0 0 0 10400 530 1 1 0 410 576 98 25 0 10400 98 2 8 1140886340 131137 10480 0 642 8 4278190080 0 535 0 0 0 10480 642 8 4278190080 8 4294903529 234 256 98 4 410 8 ##(Smalltalk.RadioButton) 98 16 0 10480 98 2 8 1141055497 1 10656 721990 2 ##(Smalltalk.ValueHolder) 0 0 1376774 ##(Smalltalk.PluggableSearchPolicy) 2434 8 #= 98 0 2434 8 #hash 98 0 32 0 0 7 0 0 0 10656 0 8 4294907745 852486 ##(Smalltalk.NullConverter) 0 0 0 994 202 208 98 2 1058 1088 98 2 770 161 1 770 111 51 10656 1058 6304 98 1 8 'C&lass' 10656 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 80 0 0 0 0 0 0 0 135 0 0 0 25 0 0 0] 98 0 1216 0 27 8 'classMode' 410 10672 98 16 0 10480 98 2 8 1141055497 1 11168 10738 0 0 10770 2434 10816 98 0 2434 10864 98 0 32 0 0 7 0 0 0 11168 0 8 4294907745 10914 0 0 0 994 202 208 98 2 1058 1088 98 2 770 21 1 770 131 51 11168 1058 6304 98 1 8 'In&stance' 11168 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 0 0 0 0 75 0 0 0 25 0 0 0] 98 0 1216 0 27 8 'instanceMode' 234 256 1200 98 0 234 240 1200 8482 770 21 1 770 1 1 1 0 770 33 31 770 45 45 0 1842 11 1 1 994 202 208 98 2 1058 1088 98 2 770 1 311 770 437 51 10480 1058 2000 1200 10480 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 155 0 0 0 218 0 0 0 180 0 0 0] 98 2 11168 10656 1216 0 27 0 0 410 880 98 14 0 10400 98 2 8 1140916224 131073 11904 0 0 0 31 0 0 0 11904 946 8 ##(Smalltalk.MethodBrowser) 8 #resource_Class_browser_method_list 0 994 202 208 98 1 1058 1088 98 2 770 1 1 770 437 311 11904 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 218 0 0 0 155 0 0 0] 1200 1216 0 27 234 256 98 4 10480 8 'mode' 11904 8 'methods' 0 994 202 208 98 1 1058 1088 98 2 770 893 1 770 437 361 10400 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 190 1 0 0 0 0 0 0 152 2 0 0 180 0 0 0] 98 2 11904 10480 1216 0 27 1216 0 27 3248 410 3088 98 15 0 3072 98 2 8 1140850688 131073 12384 0 0 0 7 0 0 0 12384 530 1 1 0 0 0 0 410 8 ##(Smalltalk.CardContainer) 98 16 0 12384 98 2 8 1140850688 131073 12464 0 4706 1058 4752 98 0 4784 0 23 5026 0 16 98 2 5026 0 16 98 4 5074 1025 5106 2434 8 #tabOrientation: 98 1 8 #top 8 '&Top' 1 1 0 0 0 5074 1025 5106 2434 12704 98 1 8 #bottom 8 '&Bottom' 1 1 0 0 0 5074 1025 5106 2434 12704 98 1 5952 8 '&Left' 1 1 0 0 0 5074 1025 5106 2434 12704 98 1 8 #right 8 '&Right' 1 1 0 0 0 8 '&Orientation' 0 134217729 0 0 0 0 0 5026 0 16 98 5 5074 1025 5106 2434 8 #viewMode: 98 1 9488 8 '&No Icons' 1 1 0 0 0 5074 1025 5106 2434 13136 98 1 8144 8 '&Small Icons' 1 1 0 0 0 5074 1025 5106 2434 13136 98 1 8 #mediumIcons 8 'Medium Icons' 1 1 0 0 0 5074 1025 5106 2434 13136 98 1 8 #largeIcons 8 '&Large Icons' 1 1 0 0 0 5074 1 5106 2434 13136 98 1 8 #tileIcons 8 'Tile Icons' 1 1 0 0 0 8 '&View' 0 134217729 0 0 0 0 0 8 '' 0 134217729 0 0 0 0 0 0 0 12464 4450 202 208 98 2 2754 4530 8 'Method source' 1058 7296 98 0 2528 20981 410 880 98 14 0 12464 98 2 8 1140850688 131073 13712 0 0 0 5 0 0 0 13712 946 8 ##(Smalltalk.MethodWorkspace) 10064 0 994 202 208 98 1 1058 1088 98 2 770 9 55 770 1313 301 13712 1154 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 4 0 0 0 27 0 0 0 148 2 0 0 177 0 0 0] 1200 1216 0 27 2754 4530 8 'Class definition' 1058 7296 98 0 8 ##(Smalltalk.Class) 21493 410 880 98 14 0 12464 98 2 8 1140916224 131073 14048 0 0 0 23 0 0 0 14048 946 8 ##(Smalltalk.SmalltalkWorkspace) 10064 0 994 202 208 98 1 1058 1088 98 2 770 9 55 770 1313 301 14048 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 4 0 0 0 27 0 0 0 148 2 0 0 177 0 0 0] 1200 1216 0 27 14048 234 256 98 4 14048 8 'definition' 13712 8 'source' 0 410 7760 98 28 0 12464 98 2 8 1140916736 1 14352 4914 202 208 98 2 13648 13968 0 4976 12544 0 17 0 0 0 14352 0 8 4294903943 2304 2320 2352 0 0 0 0 0 8144 0 0 0 0 0 994 202 208 98 3 1058 1088 98 2 770 1 1 770 1329 363 14352 1058 8288 98 1 98 1 5 14352 1058 8352 98 2 -1 1 14352 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 152 2 0 0 181 0 0 0] 98 0 1216 0 27 994 202 208 98 2 1058 1088 98 2 770 1 1 770 1329 363 12464 1058 6256 98 1 12592 12464 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 152 2 0 0 181 0 0 0] 98 3 13712 14048 14352 1216 0 27 234 256 98 2 12464 8 'cards' 0 994 202 208 98 1 1058 1088 98 2 770 1 371 770 1329 363 12384 1154 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 185 0 0 0 152 2 0 0 110 1 0 0] 98 1 12464 1216 0 27 1216 0 27 234 256 98 4 560 8 'toolbar' 2064 8 'statusbar' 0 461638 4 ##(Smalltalk.MenuBar) 0 16 98 9 5026 0 16 98 8 5074 1 5106 8 #fileNew 8 '&New' 9373 1 263494 3 ##(Smalltalk.Icon) 0 16 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'FileNew.ico' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' 0 0 0 5074 1 5106 8 #fileOpen 8 '&Open...' 9375 1 15330 0 16 15376 8 'FileOpen.ico' 15424 0 0 5074 1 5106 8 #fileFileIn 8 '&File In...' 1 1 0 0 0 5234 4097 5074 1 5106 8 #saveImage 8 'Sa&ve Image' 1 1 15330 0 16 15376 8 'Snapshot.ico' 15424 0 0 5074 1 5106 8 #smalltalkExit 8 'E&xit Dolphin' 1 1 15330 0 16 15376 8 'PowerSwitch.ico' 15424 0 0 5234 4097 5074 1 5106 8 #exit 8 '&Close' 17639 1 15330 0 16 15376 8 'CloseWindow.ico' 15424 0 0 8 '&File' 0 134217729 0 0 24163 0 0 5026 0 16 98 13 5074 1 5106 8 #undo 8 '&Undo' 9397 1 15330 0 16 15376 8 'EditUndo.ico' 15424 0 0 5234 4097 5074 1 5106 8 #cutSelection 8 'Cu&t' 9393 1 15330 0 16 15376 8 'EditCut.ico' 15424 0 0 5074 1 5106 8 #copySelection 8 '&Copy' 9351 1 15330 0 16 15376 8 'EditCopy.ico' 15424 0 0 5074 1 5106 8 #pasteClipboard 8 '&Paste' 9389 1 15330 0 16 15376 8 'EditPaste.ico' 15424 0 0 5074 1 5106 8 #editDelete 8 '&Delete' 1 1 15330 0 16 15376 8 'EditClear.ico' 15424 0 0 5026 0 16 98 2 5074 1 5106 8 #reformatSource 8 '&Source' 9391 1 0 0 0 5074 1 5106 8 #reformatComment 8 '&Comment' 9367 1 0 0 0 8 'Ref&ormat' 0 134217729 0 0 24179 0 0 5234 4097 5074 1 5106 8 #selectAll 8 'Select &All' 9347 1 0 0 0 5234 4097 5074 1 5106 8 #editFind 8 '&Find...' 9357 1 15330 0 16 15376 47 786694 ##(Smalltalk.ShellLibrary) 0 0 5074 1 5106 8 #findNext 8 'Find &Next' 1253 1 15330 0 16 15376 8 'FindNext.ico' 15424 0 0 5074 1 5106 8 #findReplace 8 '&Replace...' 9361 1 0 0 0 8 '&Edit' 0 134217729 0 0 24189 0 0 5026 0 16 98 16 5074 1 5106 8 #browseIt 8 '&Browse It' 9349 1 15330 0 16 15376 8 'ClassBrowserShell.ico' 15424 0 0 5074 1 5106 8 #displayIt 8 '&Display It' 9353 1 15330 0 16 15376 8 'DisplayIt.ico' 15424 0 0 5074 1 5106 8 #evaluateIt 8 '&Evaluate It' 9355 1 15330 0 16 15376 8 'EvaluateIt.ico' 15424 0 0 5074 1 5106 8 #inspectIt 8 '&Inspect It' 9363 1 15330 0 16 15376 8 'InspectIt.ico' 15424 0 0 5074 1 5106 8 #debugIt 8 'Deb&ug It' 1269 1 15330 0 16 15376 8 'Debugger.ico' 15424 0 0 5074 1 5106 8 #fileItIn 8 'Fi&le It In' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browseDefinitions 8 'Defi&nitions' 1271 1 0 0 0 5074 1 5106 8 #browseReferences 8 '&References' 5367 1 0 0 0 5234 4097 5074 2097153 5106 8 #accept 8 '&Accept' 9383 1 0 0 0 5074 1 5106 8 #reformatAccept 8 'Refor&mat/Accept' 13479 1 0 0 0 5234 4097 5026 0 16 98 14 5074 1 5106 8 #renameVariable 8 'Re&name <1d>...' 1 1 0 0 0 5234 4097 5074 1 5106 8 #extractToTemporary 8 'Extract to &Temporary...' 9385 1 0 0 0 5074 1 5106 8 #extractMethod 8 'E&xtract Method...' 9371 1 0 0 0 5074 1 5106 8 #extractToComponent 8 'Extract to &Component...' 1 1 0 0 0 5074 1 5106 8 #inlineMessage 8 'Inline &Message' 13467 1 0 0 0 5234 4097 5074 1 5106 8 #inlineTemporary 8 '&Inline Temporary' 13481 1 0 0 0 5074 1 5106 8 #moveTempToInnerScope 8 'Move to Inner &Scope' 9655 1 0 0 0 5074 1 5106 8 #convertTempToInstVar 8 'Con&vert to Instance Variable' 1 1 0 0 0 5234 4097 5074 1 5106 8 #addParameterToMessage 8 '&Add Parameter to <1d>...' 1 1 0 0 0 5074 1 5106 8 #inlineParameter 8 'In&line Parameter' 1 1 0 0 0 5074 1 5106 8 #removeParameter 8 'Remove &Parameter' 1 1 0 0 0 8 'Re&factorings' 8 #codeRefactoringsMenu 134217729 15330 0 16 15376 8 'Refactoring.ico' 15424 0 24233 0 0 5234 4097 5026 0 16 98 7 5074 1 5106 8 #toggleAutoCompletion 8 '&Auto-complete' 1 1 0 0 0 5074 1 5106 8 #toggleIndentationGuides 8 'Indentation &Guides' 1 1 0 0 0 5074 1 5106 8 #toggleLineEndings 8 'Line &Endings' 1 1 0 0 0 5074 1 5106 8 #toggleLineNumbers 8 'Line N&umbers' 1 1 0 0 0 5074 1 5106 8 #toggleStyling 8 '&Syntax Coloring' 1 1 0 0 0 5074 1 5106 8 #toggleWhitespace 8 'W&hitespace' 1 1 0 0 0 5074 1 5106 8 #toggleWordWrap 8 '&Word Wrap' 1 1 0 0 0 8 '&Options' 0 134217729 0 0 24249 0 0 8 '&Workspace' 0 134217729 0 0 24251 0 0 5026 0 16 98 20 5074 2097153 5106 8 #findClass 8 'Find...' 1 1 15330 0 16 15376 8 'FindClass.ico' 15424 0 0 5026 0 16 98 10 5074 1 5106 8 #browseClassPackage 8 'Package <1d>' 1 1 15330 0 16 15376 8 'Package.ico' 15424 0 0 5234 4097 5074 2097153 5106 8 #browseClassReferences 8 '&Class References' 1 1 0 0 0 5026 0 16 98 0 8 'Local Re&ferences To' 8 #browseVariablesMenu 134217729 0 0 24259 0 0 5234 4097 5074 1 5106 8 #browseChangedMethods 8 'Changed &Methods' 1 1 0 0 0 5074 1 5106 8 #browseMethodHistoryForClass 8 'Method &History' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browsePublishedEvents 8 'Published &events' 1 1 0 0 0 5074 1 5106 8 #browsePublishedAspects 8 'Published &aspects' 1 1 0 0 0 8 '&Browse' 8 #browseMenu 134217729 0 0 24269 0 0 5234 4097 5074 1 5106 8 #newClass 8 '&New...' 1 1 15330 0 16 15376 8 'NewClass.ico' 15424 0 0 5074 1 5106 8 #deleteClassHierarchy 8 '&Delete' 1 1 15330 0 16 15376 8 'EditClear.ico' 15424 0 0 5026 0 16 98 19 5074 1 5106 8 #safeRemoveClass 8 '&Remove' 1 1 0 0 0 5074 2097153 5106 8 #renameClass 8 'Re&name...' 1 1 0 0 0 5074 1 5106 8 #copyClass 8 'Cl&one...' 1 1 0 0 0 5234 4097 5074 1 5106 6704 8 'Add <1s>&Instance Variable...' 1 1 0 0 0 5074 1 5106 8 #addClassVariable 8 'Add &Class Variable...' 1 1 0 0 0 5026 0 16 98 0 8 'Re&move Variable' 8 #removeVariables 134217729 0 0 24285 0 0 5026 0 16 98 0 8 'Ren&ame Variable' 8 #renameVariables 134217729 0 0 24287 0 0 5234 4097 5026 0 16 98 0 8 'Push &Down' 8 #pushDownVariables 134217729 0 0 24289 0 0 5026 0 16 98 0 8 'Pull &Up' 8 #pullUpVariables 134217729 0 0 24291 0 0 5234 4097 5026 0 16 98 0 8 'Cr&eate Accessors' 8 #createVariableAccessors 134217729 0 0 24293 0 0 5026 0 16 98 0 8 'A&bstract' 8 #abstractVariables 134217729 0 0 24295 0 0 5026 0 16 98 0 8 '&Protect/Concrete' 8 #protectVariables 134217729 0 0 24297 0 0 5234 4097 5074 1 5106 8 #convertToSibling 8 'Con&vert to Sibling...' 1 1 0 0 0 5234 4097 5074 1 5106 8 #removeDuplicateMethods 8 'Remove Dup&licate Methods' 1 1 0 0 0 8 '&Refactorings' 8 #classRefactoringsMenu 134217729 15330 0 16 15376 8 'Refactoring.ico' 15424 0 24303 0 0 5234 4097 5074 1 5106 8 #createInstanceVariableAccessors 8 'Create &Accessors...' 1 1 0 0 0 5074 1 5106 8 #reformatAll 8 'Refor&mat All' 1 1 0 0 0 5234 4097 5074 1 5106 8 #fileInClass 8 'File &In...' 1 1 0 0 0 5074 1 5106 8 #fileOutClass 8 'File &Out...' 1 1 0 0 0 5234 4097 5074 1 5106 8 #classPackage 8 '&Package...' 1 1 15330 0 16 15376 8 'Package.ico' 15424 0 0 5074 1 5106 8 #categorizeClass 8 '&Category...' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browseClassEditions 8 'Browse &Editions' 1 1 0 0 0 5074 1 5106 8 #compareClass 8 'Compare with...' 1 1 0 0 0 5234 4097 5026 0 16 98 4 5074 1 5106 8 #newView 8 '&New...' 1 1 0 0 0 5234 4097 5026 0 16 98 0 8 '&Edit' 8 #viewsEditMenu 1 0 0 24323 0 0 5026 0 16 98 0 8 '&Show' 8 #viewsShowMenu 1 0 0 24325 0 0 8 '&Views' 8 #viewsMenu 1 15330 0 16 15376 8 'View.ico' 15424 0 24327 0 0 8 '&Class' 0 134217729 0 0 24329 0 0 5026 0 16 98 18 5026 0 16 98 0 8 'De&finitions of' 8 #definitionsMenu 1 0 0 24331 0 0 5026 0 16 98 0 8 '&References to' 8 #referencesMenu 1 0 0 24333 0 0 5026 0 16 98 14 5074 1 5106 8 #browseReferencesToGlobal 8 'References to Global...' 1 1 0 0 0 5074 1 5106 8 #browseContainingText 8 'C&ontaining Text...' 1 1 15330 0 16 15376 8 'SearchText.ico' 15424 0 0 5074 1 5106 9264 8 'Cate&gory...' 1 1 0 0 0 5074 1 5106 8 #browseCompilationFailures 8 'Compilation &Failures' 1 1 0 0 0 5074 1 5106 8 #browseCompilationIssues 8 'Compilation Iss&ues' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browseMethodPackages 8 '&Package <s>' 1 1 0 0 0 5074 1 5106 8 #browseMethodClasses 8 '&Class <s>' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browseMethodHistory 8 'Change &History' 1 1 0 0 0 5074 1 5106 8 #browseAllChangedMethods 8 '&All Changed Methods' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browseMethodInheritanceChain 8 '&Inheritance Chain' 1 1 0 0 0 5074 1 5106 8 #browseOverriddenMethod 8 'Goto &Superclass Definition' 1 1 0 0 0 8 '&Browse other' 0 134217729 0 0 24357 0 0 5234 4097 5074 1 5106 8 #newMethod 8 '&New' 1 1 15330 0 16 15376 8 'NewMethod.ico' 15424 0 0 5074 1 5106 8 #removeMethod 8 '&Delete' 1 1 15330 0 16 15376 8 'EditClear.ico' 15424 0 0 5026 0 16 98 17 5074 1 5106 8 #renameMethod 8 'Re&name' 1 1 0 0 0 5074 1 5106 8 #renameMethodReferences 8 'Rename Re&ferences...' 1 1 0 0 0 5074 1 5106 8 #safeRemoveMethods 8 'Rem&ove' 1 1 0 0 0 5234 4097 5074 1 5106 8 #addParameter 8 'Add &Parameter...' 1 1 0 0 0 5026 0 16 98 0 8 'Remo&ve Parameter' 8 #removeParameterMenu 134217729 0 0 24371 0 0 5026 0 16 98 0 8 'Rena&me Parameter' 8 #renameParameterMenu 134217729 0 0 24373 0 0 5026 0 16 98 0 8 '&Inline Parameter' 8 #inlineParameterMenu 134217729 0 0 24375 0 0 5234 4097 5026 0 16 98 0 8 'Rename &Temporary' 8 #renameTempMenu 134217729 0 0 24377 0 0 5026 0 16 98 0 8 'Convert Temp to Inst. Var.' 8 #convertTempToInstVarMenu 134217729 0 0 24379 0 0 5234 4097 5074 1 5106 8 #inlineAllSelfSends 8 'Inline &Self Sends' 1 1 0 0 0 5074 1 5106 8 #pushUpMethods 8 'Push &Up' 9325 1 0 0 0 5074 1 5106 8 #pushDownMethods 8 'Push &Down' 9327 1 0 0 0 5074 1 5106 8 #overrideMethods 8 'Ove&rride <1d>' 1 1 0 0 0 5074 1 5106 8 #moveMethod 8 'Move to &Component...' 1 1 0 0 0 8 'Refactorin&gs' 8 #methodRefactoringsMenu 134217729 15330 0 16 15376 8 'Refactoring.ico' 15424 0 24391 0 0 5234 4097 5074 1 5106 8 #methodPackage 8 '&Package...' 1 1 15330 0 16 15376 8 'Package.ico' 15424 0 0 5026 0 16 98 0 8 'Add to &Category' 8 #addCategoryMenu 134217729 0 0 24395 0 0 5026 0 16 98 0 8 'Re&move from Category' 8 #removeCategoryMenu 134217729 0 0 24397 0 0 5074 1 5106 8 #togglePrivate 8 'Pri&vate' 1 1 0 0 0 5234 4097 5074 1 5106 8 #browseMethodEditions 8 'Browse &Editions' 1 1 0 0 0 5074 1 5106 8 #browseAvailableMethods 8 'Browse Available Editions' 1 1 0 0 0 5234 4097 5074 1 5106 8 #toggleFilterObjectMethods 8 'Filter &Object Methods' 1 1 0 0 0 5074 1 5106 8 #toggleShowInheritedMethods 8 'Show &Inherited Methods' 1 1 0 0 0 8 '&Method' 0 134217729 0 0 24409 0 0 5026 0 16 98 7 5074 1 5106 8 #undoChange 8 '&Undo <1d>' 1 1 15330 0 16 15376 8 'EditUndo.ico' 15424 0 0 5074 1 5106 8 #redoChange 8 '&Redo <1d>' 1 1 15330 0 16 15376 8 'EditRedo.ico' 15424 0 0 5074 1 5106 8 #clearChangeHistory 8 'Clear Change &History' 1 1 0 0 0 5234 4097 5074 1 5106 8 #historyBack 8 'Back to <1d>' 1 1 15330 0 16 15376 8 'HistoryBack.ico' 15424 0 0 5074 1 5106 8 #historyForward 8 'Forward to <1d>' 1 1 15330 0 16 15376 8 'HistoryForward.ico' 15424 0 0 5074 1 5106 8 #historyClear 8 'Clear Visit History' 1 1 0 0 0 8 'H&istory' 0 134217729 0 0 24423 0 0 5026 0 16 98 0 8 '&Tools' 8 #toolsMenu 134217729 0 0 24425 0 0 5026 0 16 98 0 8 'Wi&ndow' 8 #windowMenu 134217729 0 0 24427 0 0 5026 0 16 98 15 5074 1 5106 8 #helpContents 8 '&Contents' 1025 1 15330 0 16 15376 49 16848 0 0 5074 1 5106 8 #help 8 'On this &Tool' 1249 1 0 0 0 5074 1 5106 8 #helpWhatsThis 8 'What''s This?' 5345 1 0 0 0 5234 4097 5074 1 5106 8 #learnSmalltalk 8 'Learn Smalltalk' 1 1 0 0 0 5234 4097 5074 1 5106 8 #helpWhatsNew 8 'What''s &New' 1 1 0 0 0 5074 1 5106 8 #helpGuidedTour 8 '&Guided Tour' 1 1 0 0 0 5074 1 5106 8 #helpTutorials 8 'Tutorials' 1 1 0 0 0 5234 4097 5074 1 5106 8 #objectArtsHomePage 8 'Object Arts Homepage' 1 1 0 0 0 5074 1 5106 8 #dolphinNewsgroup 8 'Dolphin Newsgroup/Forum' 1 1 0 0 0 5074 1 5106 8 #dolphinWikiWeb 8 'Dolphin WikiWeb' 1 1 0 0 0 5234 4097 5074 1 5106 8 #aboutDolphin 8 '&About Dolphin Smalltalk' 1 1 15330 0 16 15376 8 '!!APPLICATION' 15424 0 0 8 '&Help' 0 134217729 0 0 24451 0 0 8 '' 0 134217729 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 994 202 208 98 3 1058 1088 98 2 770 3839 21 770 1361 991 416 1058 6304 98 1 8 'Class Hierarchy Browser' 416 1058 8 #updateMenuBar 1200 416 1154 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 7 0 0 10 0 0 0 39 10 0 0 249 1 0 0] 98 3 560 3072 2064 1216 0 27 )!

toolsFolderHelpId
	^10520!

uninitialize
	"Private - Uninitialize the receiver prior to remove from the system.
		self uninitialize
	"

	Smalltalk developmentSystem
		removeSystemFolderIconNamed: self toolDescription;
		unregisterTool: self! !
!ClassBrowserShell class categoriesFor: #displayOn:!displaying!public! !
!ClassBrowserShell class categoriesFor: #icon!constants!public! !
!ClassBrowserShell class categoriesFor: #initialize!initializing!private! !
!ClassBrowserShell class categoriesFor: #resource_Default_view!public!resources-views! !
!ClassBrowserShell class categoriesFor: #toolsFolderHelpId!public! !
!ClassBrowserShell class categoriesFor: #uninitialize!class hierarchy-removing!private! !

