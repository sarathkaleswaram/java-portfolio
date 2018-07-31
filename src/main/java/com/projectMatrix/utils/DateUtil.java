/**
 *
 */
package com.projectMatrix.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 * @author yogavarun.m
 *
 */

public class DateUtil {

    public static final DateTime SYSTEM_MAX_DATE_TIME = new DateTime(2999, 12, 31, 0, 0, 0, 0);
    public static final DateTime SYSTEM_MIN_DATE_TIME = new DateTime(1900, 1, 1, 0, 0, 0, 0);
    public static final String DATE_FORMAT = "MM/dd/yyyy";
    public static final String DATE_FORMAT_TIME = "dd/MM/yyyy HH:mm";
    public static final String DAY_FORMAT = "d";
    public static final String DAY_HALFDAY_FORMAT = "d EE";
    public static final String MONTH_FORMAT = "MMM";
    public static final String HALFDAY_FORMAT = "EE";
    public static final String FULLDAY_FORMAT = "EEEE";
    public static final String TIME_FORMAT = "HH:mm";

    public static final String SHORT_YEAR_DATE_FORMAT = "dd/MM/yy HH:mm:ss";
    public static final String[] DATE_TIME_FORMATS = { DATE_FORMAT, "yyyy-MM-dd'T'HH:mm:ss.SSSZ", "yyyyMMdd", "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "yyyy-MM-dd HH:mm:ss",
            "MM/dd/yyyy HH:mm:ss", "MM/dd/yyyy'T'HH:mm:ss.SSS'Z'", "MM/dd/yyyy'T'HH:mm:ss.SSSZ", "MM/dd/yyyy'T'HH:mm:ss.SSS",
            "MM/dd/yyyy'T'HH:mm:ssZ", "MM/dd/yyyy'T'HH:mm:ss", "yyyy:MM:dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss.S", "dd-MMM-yy" };
    public static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormat.forPattern(DATE_FORMAT);
    public static final DateTimeFormatter SHORT_DATE_TIME_FORMATTER = DateTimeFormat.forPattern(SHORT_YEAR_DATE_FORMAT);

    public static final String SYSTEM_MAX_DATE = "12/31/2999";
    public static final String SYSTEM_MIN_DATE = "01/01/1900";
    public static final String DATE_FORMATYMD = "yyyy-MM-dd";
    public static final String DATE_FORMATYMDSEC = "yyyy-MM-dd HH:mm:ss.SSS";
    public static final String DATE_FORMATYMDHHMMSEC = "yyyy-MM-dd HH:mm:ss";

    /**
     * Specialized date format for Minute Book Project uploads
     */
    public static final String LONG_DATE_FORMAT = "dd/MM/yyyy hh:mm:ss a";
    public static final String LONG_DATE_FORMAT_2 = "dd/MM/yyyy hh:mm a";
    public static final String LONG_TIME_FORMAT = "hh:mm:ss a";
    public static final DateTimeFormatter DATE_TIME_FORMATTER_2 = DateTimeFormat.forPattern(LONG_DATE_FORMAT_2);

    /**
     * Constructor for DateUtil
     */
    protected DateUtil() {
        // do nothing
    }

    public static Date addHours(final Date d1, final int hours) {
        if (d1 != null) {
            Calendar cal = Calendar.getInstance(); // creates calendar
            cal.setTime(d1); // sets calendar time/date
            cal.add(Calendar.HOUR_OF_DAY, hours); // adds one hour
            return cal.getTime();
        }
        return null;
    }

    public static boolean between(final Date d1, final Date d2, final Date d3) {
        return (d1.equals(d2) || d1.equals(d3)) || (d1.after(d2) && d1.before(d3));
    }

    public static boolean between(final DateTime d1, final DateTime d2, final DateTime d3) {
        return (d1.equals(d2) || d1.equals(d3)) || (d1.isAfter(d2) && d1.isBefore(d3));
    }

    /**
     * @param day
     * @param defaultFromTime
     * @return
     */
    public static String buildDateTime(final String day, final String defaultTime) {
        StringBuilder result = new StringBuilder();
        result.append(day);
        result.append(org.apache.commons.lang3.StringUtils.SPACE);
        result.append(defaultTime);
        return result.toString();
    }

    public static int calculateDifference(final Date a, final Date b) {
        int tempDifference = 0;
        int difference = 0;
        Calendar earlier = Calendar.getInstance();
        Calendar later = Calendar.getInstance();

        if (a.compareTo(b) < 0) {
            earlier.setTime(a);
            later.setTime(b);
        }
        else {
            earlier.setTime(b);
            later.setTime(a);
        }

        while (earlier.get(Calendar.YEAR) != later.get(Calendar.YEAR)) {
            tempDifference = 365 * (later.get(Calendar.YEAR) - earlier.get(Calendar.YEAR));
            difference += tempDifference;

            earlier.add(Calendar.DAY_OF_YEAR, tempDifference);
        }

        if (earlier.get(Calendar.DAY_OF_YEAR) != later.get(Calendar.DAY_OF_YEAR)) {
            tempDifference = later.get(Calendar.DAY_OF_YEAR) - earlier.get(Calendar.DAY_OF_YEAR);
            difference += tempDifference;

            earlier.add(Calendar.DAY_OF_YEAR, tempDifference);
        }
        return difference;
    }

    /**
     * @param date1
     * @param date2
     * @return
     */
    public static boolean compareDayMonthYear(final Date date1, final Date date2) {
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(date1);

        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(date2);

        if (calendar1.get(Calendar.DATE) == calendar2.get(Calendar.DATE)) {
            if (calendar1.get(Calendar.MONTH) == calendar2.get(Calendar.MONTH)) {
                if (calendar1.get(Calendar.YEAR) == calendar2.get(Calendar.YEAR)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * @param date1
     * @param date2
     * @return
     */
    public static boolean compareMonthYear(final Date date1, final Date date2) {
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(date1);

        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(date2);

        if (calendar1.get(Calendar.MONTH) == calendar2.get(Calendar.MONTH)) {
            if (calendar1.get(Calendar.YEAR) == calendar2.get(Calendar.YEAR)) {
                return true;
            }
        }
        return false;
    }

    /**
     * utility method for date validations on the form
     *
     * @param msg
     * @param startDate
     * @param endDate
     * @return boolean
     */

    public static String convertDateStringFormat(final String strDate, final String srcFormat, final String destFormat) {
        if (StringUtils.isNotEmpty(strDate)) {
            DateTimeFormatter srcFormatter = DateTimeFormat.forPattern(srcFormat);
            DateTimeFormatter destFormatter = DateTimeFormat.forPattern(destFormat);
            DateTime date = null;
            try {
                date = srcFormatter.parseDateTime(strDate);
            }
            catch (Exception e) {
                return StringUtils.EMPTY;
            }
            return date.toString(destFormatter);
        }
        return StringUtils.EMPTY;
    }

    /**
     * utility method for date validations on the form
     *
     * @param msg
     * @param startDate
     * @param endDate
     * @return boolean
     */

    public static DateTime convertStringToDateString(final String strDate, final String srcFormat, final String destFormat) {
        if (StringUtils.isNotEmpty(strDate)) {
            DateTimeFormatter srcFormatter = DateTimeFormat.forPattern(srcFormat);
            //            DateTimeFormatter destFormatter = DateTimeFormat.forPattern(destFormat);
            DateTime date = null;
            try {
                date = srcFormatter.parseDateTime(strDate);
            }
            catch (Exception e) {
                return null;
            }
            return date;
        }
        return null;
    }

    public static boolean equal(final Date d1, final Date d2) {
        return d1.equals(d2);
    }

    /**
     * NOTE: This really should have been called parse(), not format
     *
     * @param date
     *            String representing the date
     * @return DateTime
     */
    public static DateTime format(final String date) {
        if (StringUtils.isBlank(date)) {
            return null;
        }
        return DATE_TIME_FORMATTER.parseDateTime(date);
    }

    public static Date formatDate(final String ds) {
        if (StringUtils.isBlank(ds)) {
            return null;
        }
        String format = "dd-MM-yyyy";
        SimpleDateFormat dateFormatter = new SimpleDateFormat(format);
        try {
            return dateFormatter.parse(ds);
        }
        catch (ParseException e) {
            return null;
        }
    }
    
    public static Date formatDate_DB(final String ds) {
        if (StringUtils.isBlank(ds)) {
            return null;
        }
        String format = "yyyy-MM-dd";
        SimpleDateFormat dateFormatter = new SimpleDateFormat(format);
        try {
            return dateFormatter.parse(ds);
        }
        catch (ParseException e) {
            return null;
        }
    }
    

    public static String formatDateAsHHMMString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(TIME_FORMAT);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static String formatDateAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static String formatDateAsStringYMD(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(DATE_FORMATYMD);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static Date formatDateStrToYYYYMMDD(final String ds) {
        SimpleDateFormat dateFormatter = new SimpleDateFormat(DATE_FORMATYMD);
        try {
            return dateFormatter.parse(ds);
        }
        catch (ParseException e) {
            return null;
        }
    }

    public static String formatDateTimeAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(DATE_FORMAT_TIME);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    /**
     *
     * @param ds
     * @return
     */

    public static Date formatDateToMMDDYYYY(final String ds) {
        String format = "MMddyyyy";
        SimpleDateFormat dateFormatter = new SimpleDateFormat(format);
        try {
            return dateFormatter.parse(ds);
        }
        catch (ParseException e) {
            return null;
        }
    }

    public static Date formatDateToStrYMDHHMMSEC(final String ds) {
        SimpleDateFormat dateFormatter = new SimpleDateFormat(DATE_FORMATYMDHHMMSEC);
        try {
            return dateFormatter.parse(ds);
        }
        catch (ParseException e) {
            return null;
        }
    }

    public static String formatDayAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(DAY_FORMAT);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static String formatDayHalfDayAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(DAY_HALFDAY_FORMAT);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static String formatFullDayAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(FULLDAY_FORMAT);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static String formatHalfDayAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(HALFDAY_FORMAT);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static String formatMonthAsString(final Date formatdate) {
        String date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(MONTH_FORMAT);
            date = dateFormatter.format(formatdate);
        }
        return date;
    }

    public static DateTime formatShortDate(final String date) {
        if (StringUtils.isBlank(date)) {
            return null;
        }
        return SHORT_DATE_TIME_FORMATTER.parseDateTime(date);
    }

    public static Date formatStringAsDateTime(final String formatdate) {
        Date date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(DATE_FORMAT_TIME);
            try {
                date = dateFormatter.parse(formatdate);
            }
            catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return date;
    }

    public static Date formatStringAsDateTimeYMDHHMMss(final String formatdate) {
        Date date = null;
        if (formatdate != null) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat(DATE_FORMATYMDHHMMSEC);
            try {
                date = dateFormatter.parse(formatdate);
            }
            catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return date;
    }

    /**
     * @param date
     * @return
     */
    public static Date formatStringAsHHMMDate(final String date) {
        Date parse = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(TIME_FORMAT);
        if (StringUtils.isNotBlank(date)) {
            try {
                parse = simpleDateFormat.parse(date);
            }
            catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return parse;
    }

    public static DateTime getCurrentDate() {
        return new DateTime().withTimeAtStartOfDay();
    }

    public static DateTime getCurrentYearEnd() {
        DateTime dateTime = new DateTime();
        return new DateTime(dateTime.getYear(), 12, 31, 00, 00, 00, 00);
    }

    public static String getDateForGivenDuration(final int pDuration, final String pSourceDate) {
        String targetDate = "";
        Calendar calendar = Calendar.getInstance();

        DateFormat.getDateInstance(DateFormat.MEDIUM);
        Date date;

        SimpleDateFormat dateFormatter = (SimpleDateFormat) DateFormat.getDateInstance(DateFormat.MEDIUM);
        try {
            dateFormatter.applyPattern(DATE_FORMAT);
            dateFormatter.setTimeZone(TimeZone.getDefault());

            date = dateFormatter.parse(pSourceDate);

            calendar.setTimeZone(TimeZone.getDefault()); // Get and Set required Time zone
            calendar.setTime(date);

            calendar.add(Calendar.DAY_OF_MONTH, pDuration);
            targetDate = dateFormatter.format(calendar.getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return targetDate;
    }

    public static DateTime getDateFromMonth(final String monthName) {
        DateTime dateTime = new DateTime();
        try {
            Date date = new SimpleDateFormat("MMMM", Locale.ENGLISH).parse(monthName);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int month = cal.get(Calendar.MONTH);
            int dayOfMonth = dateTime.getMonthOfYear();
            dateTime = dateTime.minusMonths(dayOfMonth - (month + 1));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return dateTime;
    }

    public static List<Date> getDateRange(final Date fromDate, final Date toDate, final int addDays) {
        List<Date> dates = new ArrayList<Date>();
        for (Date currentDate = fromDate; !currentDate.after(toDate); currentDate = DateUtils.addDays(currentDate, addDays)) {
            dates.add(currentDate);
        }
        return dates;
    }

    /**
     * Given a DateTime, retuen it as a String in the standard format
     *
     * @param dateTime
     *            the Date to format
     * @return String
     */
    public static String getDateTimeAsString(final DateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return DATE_TIME_FORMATTER.print(dateTime);
    }

    public static DateTime getDateTimeFromLongString(final String ds) {
        return parseDate(ds);
    }

    /**
     * Parse the date from the String
     *
     * @param ds
     *            the string to parse
     * @return DateTime
     * @deprecated use {@link DateUtil#format(String)}
     */
    @Deprecated
    public static DateTime getDateTimeFromString(final String ds) {
        return format(ds);
    }

    // returns a day of the date in full form
    public static String getdayofDate(final Date date) {

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        //        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        String dayOfWeek = new SimpleDateFormat(FULLDAY_FORMAT).format(date);

        return dayOfWeek;
    }

    /**
     * @deprecated Use: DateUtil.SYSTEM_MAX_DATE_TIME
     * @return DateTime
     */
    @Deprecated
    public static DateTime getDefaultEndDate() {
        return SYSTEM_MAX_DATE_TIME;
    }

    /**
     * This method returns default start date in DateTime format.
     *
     * @deprecated Use: DateUtil.SYSTEM_MIN_DATE_TIME
     * @return DateTime
     */
    @Deprecated
    public static DateTime getDefaultStartDate() {
        return SYSTEM_MIN_DATE_TIME;
    }

    public static Calendar getNaxtDay(final Date formatDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(formatDate);
        cal.add(Calendar.DATE, 1);
        cal.getTime();
        return cal;
    }

    public static String getNexttDate(final DateTime date) {

        DateTime NexttDate = new DateTime(date);
        NexttDate = NexttDate.plusDays(1);
        DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");

        return fmt.print(NexttDate);
    }

    public static String getPastDate(final DateTime date) {

        DateTime pastDate = new DateTime(date);
        pastDate = pastDate.minusDays(1);
        DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");

        return fmt.print(pastDate);
    }

    public static Calendar getPrevDay(final Date formatDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(formatDate);
        cal.add(Calendar.DATE, -1);
        cal.getTime();
        return cal;
    }

    public static String getStringFromDateInLongDateFormat(final DateTime value) {
        DateTimeFormatter formatter = DateTimeFormat.forPattern(LONG_DATE_FORMAT);
        if (value != null) {
            return formatter.print(value);
        }
        else {
            return null;
        }
    }

    public static Long getTimeDifferenceDays(final Date d1, final Date d2) {
        try {
            return TimeUnit.MILLISECONDS.toDays(d2.getTime() - d1.getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return TimeUnit.MILLISECONDS.toHours(0L);
    }

    public static String getTimeDifferenceDaysHrMin(final Date d1, final Date d2) {
        StringBuilder result = new StringBuilder();
        try {
            long diff = d2.getTime() - d1.getTime();
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            long diffDays = diff / (24 * 60 * 60 * 1000);
            result.append(diffDays).append(" Days, ").append(diffHours).append(" Hr, ").append(diffMinutes).append(" Min");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }

    public static String getTimeDifferenceDaysHrMinSecFromSeconds(final Long diffSeconds) {
        StringBuilder result = new StringBuilder();
        try {
            if (diffSeconds > 0) {

                long diffMinutes = diffSeconds / (60) % 60;
                long secLapsed = diffSeconds % 60;

                long diffHours = diffSeconds / (60 * 60) % 24;
                long diffDays = diffSeconds / (24 * 60 * 60);
                result.append(diffDays).append(" Days, ").append(diffHours).append(" Hr, ").append(diffMinutes).append(" Min, ")
                        .append(secLapsed).append(" Sec");
            }
            else {
                result.append(0).append(" Days, ").append(0).append(" Hr, ").append(0).append(" Min, ").append(0).append(" Sec");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }

    public static Long getTimeDifferenceHours(final Date d1, final Date d2) {
        try {
            return TimeUnit.MILLISECONDS.toHours(d2.getTime() - d1.getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return TimeUnit.MILLISECONDS.toHours(0L);
    }

    /**
     * @param timeDiffSeconds
     * @return
     */
    public static Double getTimeDifferenceHrMin(final Long secDiff) {
        Double timeDifference = new Double(0);
        try {
            Long diffMinutes = secDiff / (60) % 60;
            Long diffHours = secDiff / (60 * 60) % 24;

            timeDifference += diffHours.doubleValue();
            timeDifference += diffMinutes.doubleValue() / 100;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return timeDifference;
    }

    public static String getTimeDifferenceHrMinSec(final Date d1, final Date d2) {
        StringBuilder result = new StringBuilder();
        try {
            //in milliseconds
            long diff = d2.getTime() - d1.getTime();
            long diffSec = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            result.append(diffHours).append(" Hr, ").append(diffMinutes).append(" Min, ").append(diffSec).append(" Sec");

        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }

    public static String getTimeDifferenceHrMinSecFromSeconds(final Long diffSeconds) {
        StringBuilder result = new StringBuilder();
        try {
            if (diffSeconds > 0) {

                long diffMinutes = diffSeconds / (60) % 60;
                long secLapsed = diffSeconds % 60;

                long diffHours = diffSeconds / (60 * 60) % 24;
                result.append(diffHours).append(" Hr, ").append(diffMinutes).append(" Min, ").append(secLapsed).append(" Sec");
            }
            else {
                result.append(0).append(" Hr, ").append(0).append(" Min, ").append(0).append(" Sec");
            }

        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }

    public static long getTimeDifferenceMinutes(final Date d1, final Date d2) {
        try {
            return TimeUnit.MILLISECONDS.toMinutes(d2.getTime() - d1.getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return TimeUnit.MILLISECONDS.toHours(0L);
    }

    public static long getTimeDifferenceSeconds(final Date d1, final Date d2) {
        try {
            return TimeUnit.MILLISECONDS.toSeconds(d2.getTime() - d1.getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return TimeUnit.MILLISECONDS.toSeconds(0L);
    }

    public static long getTimeDifferenceYears(final Date d1, final Date d2) {
        long diffYears = 0L;
        try {
            //in milliseconds
            long diff = d2.getTime() - d1.getTime();
            diffYears = diff / (60 * 60 * 1000 * 24 * 365);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return diffYears;
    }

    public static String getTimeStringFromDateTime(final DateTime value) {
        DateTimeFormatter formatter = DateTimeFormat.forPattern(LONG_TIME_FORMAT);
        if (value != null) {
            return formatter.print(value);
        }
        else {
            return null;
        }
    }

    public static String getToday() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
        return dateFormat.format(date);
    }

    public static String getWorkingHours(final Date d1, final Date d2) {
        String duration = null;
        if (d1 != null && d2 != null) {
            long diff = d1.getTime() - d2.getTime();
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000);

            if (diffHours >= 0) {
                duration = diffHours + ":" + diffMinutes;
                return duration;
            }
            else {
                duration = "00:00";
                return duration;
            }
        }
        return null;
    }

    public static boolean greaterThan(final Date d1, final Date d2) {
        return d1.after(d2);
    }

    /*
     * Validate the Date formate "MM/DD/yyyy"
     * validateDate
     * @param String date
     * @return boolean
     */

    public static boolean greaterThanEqual(final Date d1, final Date d2) {
        return d1.equals(d2) || d1.after(d2);
    }

    /**
     * @param date
     * @return
     */
    public static boolean isFutureDate(final String date) {
        if (DateUtil.greaterThan(DateUtil.formatDate(date), DateUtil.formatDate(getToday()))) {
            return true;
        }
        return false;
    }

    /**
     * @param remainderDate
     * @return
     */
    public static boolean isPastDate(final String date) {
        if (DateUtil.lessThanEqual(DateUtil.formatDate(date), DateUtil.formatDate(getToday()))) {
            return true;
        }
        return false;
    }

    public static boolean isValidDate(final String date) {
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
            String sdate[] = date.split("\\/");
            String sdt = sdate[2];
            Integer.parseInt(sdt);
        }
        catch (ParseException pe) {
            return false;
        }
        catch (NumberFormatException ne) {
            return false;
        }
        catch (Exception e) {
            return false;
        }
        if (!sdf.format(testDate).equals(date)) {
            return false;
        }
        return true;
    }

    public static boolean isValidDateAndYearRange(final String date) {
        int i = 0;
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
            String sdate[] = date.split("\\/");
            String sdt = sdate[2];
            i = Integer.parseInt(sdt);
        }
        catch (ParseException pe) {
            return false;
        }
        catch (NumberFormatException ne) {
            return false;
        }
        catch (Exception e) {
            return false;
        }
        if (!sdf.format(testDate).equals(date)) {
            return false;
        }
        if (i < 1800 || i > 2999) {
            return false;
        }
        return true;
    }

    public static boolean lessThan(final Date d1, final Date d2) {
        return d1.before(d2);
    }

    public static boolean lessThanEqual(final Date d1, final Date d2) {
        return d1.equals(d2) || d1.before(d2);
    }

    public static DateTime parseDate(final String date) {
        if (StringUtils.isBlank(date)) {
            return null;
        }
        return DATE_TIME_FORMATTER_2.parseDateTime(date);
    }

    /**
     * Perform a conversion from an Object to a DateTime. If the input value is string, then it should be one of predefined format in
     * formats array, else it can be an object that can represent a Date.
     *
     * @param value
     * @return DateTime
     */
    public static DateTime toDate(final Object value) {
        if (value == null) {
            return null;
        }
        else if (value instanceof DateTime) {
            return (DateTime) value;
        }
        else if (value instanceof String) {
            final String valueString = value.toString();
            for (String format : DATE_TIME_FORMATS) {
                try {
                    DateTime parsed = DateTimeFormat.forPattern(format).parseDateTime(valueString);
                    //                    LOGGER.debug("toDate: parsed [value={}, format={}, parsed={}]", new Object[] { valueString, format, parsed });
                    return parsed;
                }
                catch (Exception e) {
                    /*
                     *  format is not matching, but don't fail
                     *  just go to the next format
                     */
                }
            }
            //            LOGGER.warn("toDate: unable to parse [value={}]", new Object[] { valueString });
        }

        return new DateTime(value);
    }

    public static boolean validateDate(final String date) {

        SimpleDateFormat df = new SimpleDateFormat(DATE_FORMAT);
        Date testDate = null;
        try {
            testDate = df.parse(date);
        }
        catch (Exception e) {
            /*
             *  invalid date format
             */
            return false;
        }
        /*
         *  now test for legal values of parameters
         */
        if (!df.format(testDate).equals(date)) {
            return false;
        }
        return true;
    }

    /*
     * Validate the Expiry Date greater than System Date i.e 12/31/2999
     * validateDate
     * @param String date
     * @return boolean
     */
    public static boolean validateExpDateGreaterThanSysDate(final String date) {
        if (DateUtil.greaterThan(DateUtil.formatDate(date), DateUtil.formatDate(SYSTEM_MAX_DATE))) {
            return false;
        }
        return true;
    }
    
    public String decimalToTimeConverter(double hours) {
		double d = hours * 60 * 60;
		int h = (int) d / 3600;
		int m = (int) d % 3600 / 60;
		String hh = h <= 9 ? "0" + h : Integer.toString(h);

		String mm = m <= 9 ? "0" + m : Integer.toString(m);
		return hh + ":" + mm + ":00";

	}
    
    
    
}
