"Filed out from Dolphin Smalltalk 7"!

SOCKADDR subclass: #SOCKADDR_IN6
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SOCKADDR_IN6 guid: (GUID fromString: '{a989cfcf-96f5-40b8-9904-cb33f7c78940}')!
SOCKADDR_IN6 comment: '<SOCKADDR_IN6> is an <ExternalStructure> class to wrap the struct ''Win32.SOCKADDR_IN6'' from type information in the ''Win32 API'' library.

The type library contains the following helpstring for this struct
	"Specifies a transport address and port for the AF_INET6 address family"

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef [uuid(A989CFCF-96F5-40B8-9904-CB33F7C78940), helpstring("Specifies a transport address and port for the AF_INET6 address family")]
struct tagSOCKADDR_IN6 {
	[helpstring("Address family; must be AF_INET6")] ADDRESS_FAMILY sin6_family;
	[helpstring("Transport level port number (N.B. network byte order)")] unsigned short sin6_port;
	[helpstring("IPv6 flow information")] unsigned long sin6_flowinfo;
	[helpstring("IPv6 address")] IN6_ADDR sin6_addr;
	union {
		[helpstring("IPv6 scope identifier that is defined in the sin6_scope_struct member")] unsigned long sin6_scope_id;
		[hidden, helpstring("Contains the scope identifier for the IPv6 transport address")] unsigned long sin6_scope_struct;
	};
} SOCKADDR_IN6;
'!
!SOCKADDR_IN6 categoriesForClass!Win32-Structs! !
!SOCKADDR_IN6 methodsFor!

flowInfo
	"Answer the <integer> flow info."

	^WS2_32Library default ntohl: self sin6_flowinfo!

flowInfo: anInteger
	"Set the <integer> flow info."

	self sin6_flowinfo: (WS2_32Library default htonl: anInteger)!

port
	"Answer the <integer> port number."

	^WS2_32Library default ntohs: self sin6_port!

port: anInteger
	"Set the <integer> port number."

	self sin6_port: (WS2_32Library default htons: anInteger)!

sin6_addr
	"Answer the <IN6_ADDR> value of the receiver's 'sin6_addr' field."

	^IN6_ADDR fromAddress: bytes yourAddress + ##(self offsetOf: #sin6_addr)!

sin6_addr: anIN6_ADDR
	"Set the receiver's 'sin6_addr' field to the value of the argument, anIN6_ADDR"

	anIN6_ADDR
		replaceBytesOf: bytes
		from: ##((self offsetOf: #sin6_addr) + 1)
		to: ##((self offsetOf: #sin6_addr) + IN6_ADDR basicByteSize)
		startingAt: 1!

sin6_family
	"Answer the <Integer> value of the receiver's 'sin6_family' field."

	^bytes wordAtOffset: 0!

sin6_family: anInteger
	"Set the receiver's 'sin6_family' field to the value of the argument, anInteger"

	bytes wordAtOffset: 0 put: anInteger!

sin6_flowinfo
	"Answer the <Integer> value of the receiver's 'sin6_flowinfo' field."

	^bytes dwordAtOffset: ##(self offsetOf: #sin6_flowinfo)!

sin6_flowinfo: anInteger
	"Set the receiver's 'sin6_flowinfo' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #sin6_flowinfo) put: anInteger!

sin6_port
	"Answer the <Integer> value of the receiver's 'sin6_port' field."

	^bytes wordAtOffset: ##(self offsetOf: #sin6_port)!

sin6_port: anInteger
	"Set the receiver's 'sin6_port' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #sin6_port) put: anInteger!

sin6_scope_id
	"Answer the <Integer> value of the receiver's 'sin6_scope_id' field."

	^bytes dwordAtOffset: ##(self offsetOf: #sin6_scope_id)!

sin6_scope_id: anInteger
	"Set the receiver's 'sin6_scope_id' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #sin6_scope_id) put: anInteger! !
!SOCKADDR_IN6 categoriesFor: #flowInfo!accessing!public! !
!SOCKADDR_IN6 categoriesFor: #flowInfo:!accessing!public! !
!SOCKADDR_IN6 categoriesFor: #port!accessing!public! !
!SOCKADDR_IN6 categoriesFor: #port:!accessing!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_addr!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_addr:!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_family!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_family:!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_flowinfo!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_flowinfo:!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_port!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_port:!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_scope_id!**compiled accessors**!public! !
!SOCKADDR_IN6 categoriesFor: #sin6_scope_id:!**compiled accessors**!public! !

!SOCKADDR_IN6 class methodsFor!

addressFamily
	^WinSocketConstants.AF_INET6!

defineFields
	"Define the fields of the SOCKADDR_IN6 structure.

	SOCKADDR_IN6  compileDefinition

		typedef [uuid(a989cfcf-96f5-40b8-9904-cb33f7c78940), helpstring('Specifies a transport address and port for the AF_INET6 address family. All of the data in the structure, except for the address family, is specified in network-byte-order (big-endian).')]
		struct tagSOCKADDR_IN6 {
			[helpstring('Address family; must be AF_INET6')] ADDRESS_FAMILY sin6_family;
			[helpstring('Transport level port number in network byte order')] USHORT sin6_port;
			[helpstring('IPv6 flow information in network byte order')] ULONG sin6_flowinfo;
			[helpstring('IPv6 address')] IN6_ADDR sin6_addr;
			union {
				[helpstring('IPv6 scope identifier that is defined in the sin6_scope_struct member, in network byte order')] ULONG sin6_scope_id;
				[hidden, helpstring('Contains the scope identifier for the IPv6 transport address')] ULONG sin6_scope_struct;
			};
		} SOCKADDR_IN6;
"

	self
		
		defineField: #sin6_family type: WORDField new offset: 0;
		defineField: #sin6_port type: WORDField new offset: 2;
		defineField: #sin6_flowinfo type: DWORDField new offset: 4;
		defineField: #sin6_addr type: (StructureField type: IN6_ADDR) offset: 8;
		defineField: #sin6_scope_id type: DWORDField new offset: 24;
		defineField: #sin6_scope_struct type: DWORDField new beFiller offset: 24.
	self byteSize: 28! !
!SOCKADDR_IN6 class categoriesFor: #addressFamily!constants!public! !
!SOCKADDR_IN6 class categoriesFor: #defineFields!**auto generated**!initializing!public! !

