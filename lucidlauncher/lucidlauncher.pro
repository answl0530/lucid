#-------------------------------------------------
#
# Project created by QtCreator 2011-06-07T14:09:50
#
#-------------------------------------------------

QT       -= gui

TARGET = lucidlauncher
TEMPLATE = lib

symbian: {

    SOURCES += lucidlauncher.cpp

    HEADERS += lucidlauncher.h \
        lucidlauncher.hrh

    OTHER_FILES += \
        lucidlauncher.rss \
        eabi/lucidlauncheru.def

    pluginrsc = "SOURCEPATH ."\
      "START RESOURCE lucidlauncher.rss" \
      "END"
    
    MMP_RULES += pluginrsc

    LIBS += -lapgrfx -lecom -lcone

    TARGET.UID2 = 0x10009D8D
    TARGET.UID3 = 0x2004201D # LUCIDLAUNCHER_UID3
    TARGET.CAPABILITY = NetworkServices LocalServices Location ReadUserData WriteUserData ReadDeviceData WriteDeviceData SwEvent UserEnvironment PowerMgmt
    # additional capabilities required by Symbian Anna
    # TARGET.CAPABILITY += CommDD MultimediaDD TrustedUI ProtServ DiskAdmin NetworkControl SurroundingsDD
    TARGET.EPOCALLOWDLLDATA = 1

    addFiles.path = !:/sys/bin
    addFiles.sources = lucidlauncher.dll
    deployRsc = "\"$${EPOCROOT}epoc32/data/lucidlauncher.rsc\" - \"!:/resource/plugins/lucidlauncher.rsc\""
    addFiles.pkg_postrules += deployRsc
    DEPLOYMENT += addFiles
}
