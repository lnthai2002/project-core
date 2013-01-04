# Based on GNU Make

CLASSES = .:/home/dev/jakarta/dist/tomcat/lib/servlet.jar
JFLAGS = -deprecation -d . -classpath ${CLASSES}

OBJS = \
	com/taglib/wdjsp/faqtool/Command.class \
	com/taglib/wdjsp/faqtool/CommandException.class \
	com/taglib/wdjsp/faqtool/NullCommand.class \
	com/taglib/wdjsp/faqtool/AbortCommand.class \
	com/taglib/wdjsp/faqtool/GetCommand.class \
	com/taglib/wdjsp/faqtool/GetAllCommand.class \
	com/taglib/wdjsp/faqtool/UpdateCommand.class \
	com/taglib/wdjsp/faqtool/DeleteCommand.class \
	com/taglib/wdjsp/faqtool/AddCommand.class \
	com/taglib/wdjsp/faqtool/CommandToken.class \
	com/taglib/wdjsp/faqtool/FaqRepositoryException.class \
	com/taglib/wdjsp/faqtool/UnknownFaqException.class \
	com/taglib/wdjsp/faqtool/FaqRepository.class \

APPLET = com/taglib/wdjsp/applets/CountDown.class

BEANS = \
	com/taglib/wdjsp/fundamentals/HelloBean.class \
	com/taglib/wdjsp/components/CompoundInterestBean.class \
	com/taglib/wdjsp/components/StatBean.class \
	com/taglib/wdjsp/components/CurrentTimeBean.class \
	com/taglib/wdjsp/components/DiceBean.class \
	com/taglib/wdjsp/components/TimerBean.class \
	com/taglib/wdjsp/databases/ConnectionBean.class \
	com/taglib/wdjsp/arch/EmployeeBean.class \
	com/taglib/wdjsp/faqtool/FaqBean.class \
	com/taglib/wdjsp/commontasks/FormBean.class \
	com/taglib/wdjsp/byexample/BannerBean.class \
	com/taglib/wdjsp/byexample/FingerBean.class \
	com/taglib/wdjsp/byexample/WhoisBean.class \
	com/taglib/wdjsp/byexample/ViewHTMLBean.class \
	com/taglib/wdjsp/byexample/QuoteBean.class \
	com/taglib/wdjsp/advtags/DataBean.class \
	com/taglib/wdjsp/advtags/PlotBean.class \
	com/taglib/wdjsp/advtags/TimeOfDayBean.class \

SERVLETS = \
	com/taglib/wdjsp/arch/FetchEmployeeServlet.class \
	com/taglib/wdjsp/arch/HelloWorldServlet.class \
	com/taglib/wdjsp/faqtool/FaqServlet.class \
	com/taglib/wdjsp/faqtool/FaqAdminServlet.class \
	com/taglib/wdjsp/commontasks/FormHandlerServlet.class \

TAGS = \
	com/taglib/wdjsp/mut/DebugBufferTag.class \
	com/taglib/wdjsp/mut/DebugCookiesTag.class \
	com/taglib/wdjsp/mut/IfPropertyTag.class \
	com/taglib/wdjsp/mut/ForPropertyTag.class \
	com/taglib/wdjsp/mut/ForPropertyTEI.class \
	com/taglib/wdjsp/mut/EncodeHtmlTag.class \
	com/taglib/wdjsp/mut/OutlineBase.class \
	com/taglib/wdjsp/mut/OutlineTag.class \
	com/taglib/wdjsp/mut/OutlineItemTag.class \
	com/taglib/wdjsp/mut/UrlTag.class

DEPLOYMENT = \
	META-INF/taglib.tld \
	../WEB-INF/lib/webdev.jar \
	../WEB-INF/lib/mut.jar \
	../WEB-INF/tlds/mut.tld \

all: jars ${APPLET}

jars: webdev.jar mut.jar

install: install-webdev install-mut

install-webdev: ../WEB-INF/lib/webdev.jar
../WEB-INF/lib/webdev.jar: webdev.jar
	cp $^ ../WEB-INF/lib/

install-mut: ../WEB-INF/lib/mut.jar ../WEB-INF/tlds/mut.tld
../WEB-INF/lib/mut.jar: mut.jar mut.tld
	cp $< $@
../WEB-INF/tlds/mut.tld: mut.tld
	cp $< $@

%.class: %.java
	javac ${JFLAGS} $<

mut.jar: ${TAGS} mut.tld META-INF/taglib.tld
	jar cf $@ META-INF/taglib.tld ${TAGS}

META-INF/taglib.tld: mut.tld
	cp $< $@

webdev.jar: ${OBJS} ${BEANS} ${SERVLETS}
	jar cf $@ $^

war: ../webdev.war

../webdev.war: ${DEPLOYMENT} ${APPLET}
	@echo "Make love, not war."
	( cd ..; jar cf webdev.war `find . -name 'CVS' -prune -o -name 'src' -prune -o -name 'webdev.war' -prune -o -name '*~' -prune -o -name '.cvsignore' -prune -o -type f -print` src/${APPLET} )

dist: ../../wdjsp.zip

../../wdjsp.zip: ${DEPLOYMENT} ${APPLET}
	( cd ../..; zip wdjsp.zip `find webdev -name 'CVS' -prune -o -name '*.war' -prune -o -name 'webdev.jar' -prune -o -name 'mut.jar' -prune -o -name 'taglib.tld' -prune -o -name '*~' -prune -o -name '.cvsignore' -prune -o -name '*.class' -prune -o -type f -print` )

../../wdjsp.war: ${DEPLOYMENT} ${APPLET}
	( cd ../..; jar cf wdjsp.war `find webdev -name 'CVS' -prune -o -name 'webdev.war' -prune -o -name '*~' -prune -o -name '.cvsignore' -prune -o -name '*.class' -prune -o -type f -print` )


clean:
	find . \( -name '*.jar' -o -name '*.class' \) -exec \rm -f {} \;
	rm ${DEPLOYMENT} ../webdev.war ../../wdjsp.zip
