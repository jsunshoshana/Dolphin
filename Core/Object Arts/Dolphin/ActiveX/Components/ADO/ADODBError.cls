"Filed out from Dolphin Smalltalk X6"!

IDispatch subclass: #ADODBError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'ADODBConstants'
	classInstanceVariableNames: ''!
ADODBError guid: (IID fromString: '{00000500-0000-0010-8000-00AA006D2EA4}')!
ADODBError comment: '<ADODBError> is a wrapper class for the COM interface ''ADODB.Error'' generated from type information in the ''Microsoft ActiveX Data Objects 2.5 Library'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

Warning: This comment was automatically generated from the interface''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.'!
!ADODBError categoriesForClass!ADODB-Interfaces!COM-Interfaces! !
!ADODBError methodsFor!

description
	"Answer the <bstr> value of the 'Description' property of the receiver."

	| answer |
	answer := BSTR new.
	self get_Description: answer.
	^answer asObject
!

get_Description: pbstr
	"Private - Get the value of the 'Description' property of the receiver.
				HRESULT __stdcall Description(
			[out, retval] BSTR* pbstr);"

	<virtual stdcall: hresult 10 bstr*>
	^self invalidCall
!

get_HelpContext: pl
	"Private - Get the value of the 'HelpContext' property of the receiver.
				HRESULT __stdcall HelpContext(
			[out, retval] long* pl);"

	<virtual stdcall: hresult 12 sdword*>
	^self invalidCall
!

get_HelpFile: pbstr
	"Private - Get the value of the 'HelpFile' property of the receiver.
				HRESULT __stdcall HelpFile(
			[out, retval] BSTR* pbstr);"

	<virtual stdcall: hresult 11 bstr*>
	^self invalidCall
!

get_NativeError: pl
	"Private - Get the value of the 'NativeError' property of the receiver.
				HRESULT __stdcall NativeError(
			[out, retval] long* pl);"

	<virtual stdcall: hresult 14 sdword*>
	^self invalidCall
!

get_Number: pl
	"Private - Get the value of the 'Number' property of the receiver.
				HRESULT __stdcall Number(
			[out, retval] long* pl);"

	<virtual stdcall: hresult 8 sdword*>
	^self invalidCall
!

get_Source: pbstr
	"Private - Get the value of the 'Source' property of the receiver.
				HRESULT __stdcall Source(
			[out, retval] BSTR* pbstr);"

	<virtual stdcall: hresult 9 bstr*>
	^self invalidCall
!

get_SQLState: pbstr
	"Private - Get the value of the 'SQLState' property of the receiver.
				HRESULT __stdcall SQLState(
			[out, retval] BSTR* pbstr);"

	<virtual stdcall: hresult 13 bstr*>
	^self invalidCall
!

helpContext
	"Answer the <sdword> value of the 'HelpContext' property of the receiver."

	| answer |
	answer := (SDWORD new).
	self get_HelpContext: answer.
	^answer asObject
!

helpFile
	"Answer the <bstr> value of the 'HelpFile' property of the receiver."

	| answer |
	answer := BSTR new.
	self get_HelpFile: answer.
	^answer asObject
!

isExtensible
	"Answer whether the receiver may add methods at run-time."

	^false!

isVBCollection
	"Answer whether the receiver is a VB style collection."

	^false!

nativeError
	"Answer the <sdword> value of the 'NativeError' property of the receiver."

	| answer |
	answer := (SDWORD new).
	self get_NativeError: answer.
	^answer asObject
!

number
	"Answer the <sdword> value of the 'Number' property of the receiver."

	| answer |
	answer := (SDWORD new).
	self get_Number: answer.
	^answer asObject
!

printValueOn: aStream
	aStream print: self description!

source
	"Answer the <bstr> value of the 'Source' property of the receiver."

	| answer |
	answer := BSTR new.
	self get_Source: answer.
	^answer asObject
!

sqlState
	"Answer the <bstr> value of the 'SQLState' property of the receiver."

	| answer |
	answer := BSTR new.
	self get_SQLState: answer.
	^answer asObject
!

value
	"Answer the <bstr> value of the 'Description' property of the receiver.
	This is the default value (DISPID_VALUE) property of the receiver."

	^self description
! !
!ADODBError categoriesFor: #description!**auto generated**!properties!public! !
!ADODBError categoriesFor: #get_Description:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #get_HelpContext:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #get_HelpFile:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #get_NativeError:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #get_Number:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #get_Source:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #get_SQLState:!**auto generated**!COM Interfaces-Error!private! !
!ADODBError categoriesFor: #helpContext!**auto generated**!properties!public! !
!ADODBError categoriesFor: #helpFile!**auto generated**!properties!public! !
!ADODBError categoriesFor: #isExtensible!**auto generated**!public!testing! !
!ADODBError categoriesFor: #isVBCollection!**auto generated**!public!testing! !
!ADODBError categoriesFor: #nativeError!**auto generated**!properties!public! !
!ADODBError categoriesFor: #number!**auto generated**!properties!public! !
!ADODBError categoriesFor: #printValueOn:!printing!private! !
!ADODBError categoriesFor: #source!**auto generated**!properties!public! !
!ADODBError categoriesFor: #sqlState!**auto generated**!properties!public! !
!ADODBError categoriesFor: #value!**auto generated**!properties!public! !

!ADODBError class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'ADODB.Error'
		ADODBError defineTemplate"

	self
		defineFunction: #get_Number:
			argumentTypes: 'sdword*';
		defineFunction: #get_Source:
			argumentTypes: 'bstr*';
		defineFunction: #get_Description:
			argumentTypes: 'bstr*';
		defineFunction: #get_HelpFile:
			argumentTypes: 'bstr*';
		defineFunction: #get_HelpContext:
			argumentTypes: 'sdword*';
		defineFunction: #get_SQLState:
			argumentTypes: 'bstr*';
		defineFunction: #get_NativeError:
			argumentTypes: 'sdword*'
! !
!ADODBError class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

